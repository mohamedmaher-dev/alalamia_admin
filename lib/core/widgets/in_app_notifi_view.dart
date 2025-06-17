import 'dart:async';

import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class InAppNotifiView extends StatefulWidget {
  final String title;
  final String message;
  final int duration;
  final void Function() onDismissed;

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

class _InAppNotifiViewState extends State<InAppNotifiView>
    with SingleTickerProviderStateMixin {
  // Variable for controller
  late AnimationController _controller;
  // Variable for animation
  late Animation<Offset> _offsetAnimation;
  // Variable for duration
  late Timer duration;

  Future<void> showNotifi() async => _controller.forward();

  Future<void> closeNotifi() async {
    if (mounted) await _controller.reverse();
    widget.onDismissed();
  }

  @override
  void initState() {
    // Initialize controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    // Initialize animation
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    // Show notifi
    showNotifi();
    // Set duration
    duration = Timer(Duration(seconds: widget.duration), closeNotifi);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    duration.cancel();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => Positioned(
    top: kLargeMargin,
    left: kNormalMargin,
    right: kNormalMargin,
    child: SlideTransition(
      position: _offsetAnimation,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: Dismissible(
          onDismissed: (final direction) => closeNotifi(),
          key: GlobalKey(),
          child: Card(
            elevation: 10,
            child: Column(
              children: [
                _InAppNotifiBody(title: widget.title, message: widget.message),
                _LinearProgress(duration: widget.duration),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class _InAppNotifiBody extends StatelessWidget {
  const _InAppNotifiBody({required this.title, required this.message});
  final String title;
  final String message;
  @override
  Widget build(final BuildContext context) {
    final language = Language.of(context);
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(kNormalPadding),
        decoration: BoxDecoration(
          color: ColorManger.myGold.withAlpha(kBackgroundColorAlpha),
          borderRadius: BorderRadius.circular(kNormalRadius),
        ),
        child: const Icon(CupertinoIcons.bell_fill, color: ColorManger.myGold),
      ),
      title: Text(title),
      subtitle: Text(message),
      trailing: Text(language.now),
    );
  }
}

class _LinearProgress extends StatelessWidget {
  const _LinearProgress({required this.duration});
  final int duration;

  @override
  Widget build(final BuildContext context) => Padding(
    padding: EdgeInsets.all(kNormalPadding),
    child: SfLinearGauge(
      showAxisTrack: false,
      showTicks: false,
      showLabels: false,
      barPointers: [
        LinearBarPointer(
          edgeStyle: LinearEdgeStyle.bothCurve,
          animationType: LinearAnimationType.linear,
          value: 100,
          color: ColorManger.myGold,
          animationDuration: duration * 1000,
        ),
      ],
      ranges: [
        LinearGaugeRange(
          rangeShapeType: LinearRangeShapeType.curve,
          position: LinearElementPosition.inside,
          edgeStyle: LinearEdgeStyle.bothCurve,
          color: ColorManger.myGold.withAlpha(kBackgroundColorAlpha),
        ),
      ],
    ),
  );
}
