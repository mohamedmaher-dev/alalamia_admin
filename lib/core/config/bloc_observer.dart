import 'package:debug_print_flutter/debug_print_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Custom BLoC observer for monitoring and debugging state management throughout the app
/// Provides comprehensive logging for all BLoC/Cubit lifecycle events and state changes
/// Used for debugging, performance monitoring, and development insights
class MyBlocObserver extends BlocObserver {
  /// Debug print utility for colored console output during development
  /// Provides different color codes for different types of BLoC events
  final DebugPrint dPrint = const DebugPrint();

  /// Creates a new BLoC observer instance for state management monitoring
  /// Automatically registers with the global BLoC delegate to observe all BLoCs
  MyBlocObserver();

  /// Called when a new BLoC or Cubit instance is created
  /// Logs the creation event with the BLoC type for tracking instantiation
  /// Useful for monitoring memory usage and BLoC lifecycle management
  @override
  void onCreate(final BlocBase bloc) {
    super.onCreate(bloc);
    dPrint.white('onCreate -- ${bloc.runtimeType}');
  }

  /// Called when an event is dispatched to a BLoC (not applicable to Cubits)
  /// Logs the event type and data for debugging business logic flow
  /// Helps track user interactions and system events flow through the app
  @override
  void onEvent(final Bloc bloc, final Object? event) {
    super.onEvent(bloc, event);
    dPrint.white('onEvent -- ${bloc.runtimeType}, $event');
  }

  /// Called when any state change occurs in a BLoC or Cubit
  /// Logs both current and next state for comprehensive state tracking
  /// Essential for debugging state transitions and application flow
  @override
  void onChange(final BlocBase bloc, final Change change) {
    super.onChange(bloc, change);
    dPrint.white('onChange -- ${bloc.runtimeType}, $change');
  }

  /// Called when a transition occurs in a BLoC (event → state change)
  /// Logs the complete transition including event, current state, and next state
  /// Provides complete picture of how events transform into state changes
  @override
  void onTransition(final Bloc bloc, final Transition transition) {
    super.onTransition(bloc, transition);
    dPrint.white('onTransition -- ${bloc.runtimeType}, $transition');
  }

  /// Called when an error occurs in any BLoC or Cubit
  /// Logs error details and stack trace for debugging and error tracking
  /// Critical for identifying and fixing state management issues in production
  @override
  void onError(
    final BlocBase bloc,
    final Object error,
    final StackTrace stackTrace,
  ) {
    dPrint.error('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  /// Called when a BLoC or Cubit is disposed and closed
  /// Logs the disposal event for tracking memory cleanup and lifecycle completion
  /// Helps identify potential memory leaks and ensures proper resource cleanup
  @override
  void onClose(final BlocBase bloc) {
    super.onClose(bloc);
    dPrint.warning('onClose -- ${bloc.runtimeType}');
  }
}
