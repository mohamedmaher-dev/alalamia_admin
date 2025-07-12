import 'dart:async';

import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

/// Widget for displaying in-app notifications as overlay cards
/// Shows animated notification that slides in from top and auto-dismisses
/// Supports custom title, message, duration, and manual dismissal
class InAppNotifiView extends StatefulWidget {
  /// The notification title to display
  final String title;

  /// The notification message content
  final String message;

  /// Duration in seconds before auto-dismissal (default: 5 seconds)
  final int duration;

  /// Callback function called when notification is dismissed
  final void Function() onDismissed;

  /// Create an in-app notification widget
  /// [title] - Notification title
  /// [message] - Notification message
  /// [duration] - Auto-dismiss duration in seconds
  /// [onDismissed] - Callback for when notification is dismissed
  const InAppNotifiView({
    super.key,
    required this.title,
    required this.message,
    this.duration = 5,
    required this.onDismissed,
  });

  @override
  State<InAppNotifiView> createState() => _InAppNotifiViewState();
}

/// State class for the in-app notification widget
/// Manages animation controller, slide animation, and auto-dismiss timer
class _InAppNotifiViewState extends State<InAppNotifiView>
    with SingleTickerProviderStateMixin {
  /// Animation controller for slide-in/slide-out animations
  late AnimationController _controller;

  /// Slide animation for notification entrance/exit
  late Animation<Offset> _offsetAnimation;

  /// Timer for automatic notification dismissal
  late Timer duration;

  /// Show the notification with slide-in animation
  Future<void> showNotifi() async => _controller.forward();

  /// Hide the notification with slide-out animation and trigger callback
  Future<void> closeNotifi() async {
    if (mounted) await _controller.reverse();
    widget.onDismissed();
  }

  @override
  void initState() {
    // Initialize animation controller for 250ms animations
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    // Create slide animation from top (-1) to center (0)
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // Start the show animation
    showNotifi();

    // Set timer for automatic dismissal
    duration = Timer(Duration(seconds: widget.duration), closeNotifi);
    super.initState();
  }

  @override
  void dispose() {
    // Clean up animation controller and timer
    _controller.dispose();
    duration.cancel();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => Positioned(
    // Position at top of screen with margins
    top: kLargeMargin,
    left: kNormalMargin,
    right: kNormalMargin,
    child: SlideTransition(
      position: _offsetAnimation,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: Dismissible(
          // Allow swipe to dismiss
          onDismissed: (final direction) => closeNotifi(),
          key: GlobalKey(),
          child: Card(
            elevation: 10,
            child: Column(
              children: [
                // Notification content
                _InAppNotifiBody(title: widget.title, message: widget.message),
                // Progress indicator showing time remaining
                _LinearProgress(duration: widget.duration),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

/// Widget for the main notification content (title, message, icon)
class _InAppNotifiBody extends StatelessWidget {
  const _InAppNotifiBody({required this.title, required this.message});

  /// Notification title text
  final String title;

  /// Notification message text
  final String message;

  @override
  Widget build(final BuildContext context) {
    final language = Language.of(context);
    return ListTile(
      // Bell icon with gold background
      leading: Container(
        padding: EdgeInsets.all(kNormalPadding),
        decoration: BoxDecoration(
          color: ColorManger.myGold.withAlpha(kBackgroundColorAlpha),
          borderRadius: BorderRadius.circular(kNormalRadius),
        ),
        child: const Icon(CupertinoIcons.bell_fill, color: ColorManger.myGold),
      ),
      // Notification title
      title: Text(title),
      // Notification message
      subtitle: Text(message),
      // "Now" timestamp indicator
      trailing: Text(language.now),
    );
  }
}

/// Widget for linear progress bar showing notification auto-dismiss countdown
class _LinearProgress extends StatelessWidget {
  const _LinearProgress({required this.duration});

  /// Duration in seconds for the progress animation
  final int duration;

  @override
  Widget build(final BuildContext context) => Padding(
    padding: EdgeInsets.all(kNormalPadding),
    child: SfLinearGauge(
      // Hide axis track, ticks, and labels for clean look
      showAxisTrack: false,
      showTicks: false,
      showLabels: false,
      barPointers: [
        LinearBarPointer(
          // Animated progress bar
          edgeStyle: LinearEdgeStyle.bothCurve,
          animationType: LinearAnimationType.linear,
          value: 100,
          color: ColorManger.myGold,
          animationDuration: duration * 1000, // Convert seconds to milliseconds
        ),
      ],
      ranges: [
        LinearGaugeRange(
          // Background range for progress bar
          rangeShapeType: LinearRangeShapeType.curve,
          position: LinearElementPosition.inside,
          edgeStyle: LinearEdgeStyle.bothCurve,
          color: ColorManger.myGold.withAlpha(kBackgroundColorAlpha),
        ),
      ],
    ),
  );
}
