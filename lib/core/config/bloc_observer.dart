import 'package:debug_print_flutter/debug_print_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
  final DebugPrint dPrint = const DebugPrint();
  MyBlocObserver();
  @override
  void onCreate(final BlocBase bloc) {
    super.onCreate(bloc);
    dPrint.white('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onEvent(final Bloc bloc, final Object? event) {
    super.onEvent(bloc, event);
    dPrint.white('onEvent -- ${bloc.runtimeType}, $event');
  }

  @override
  void onChange(final BlocBase bloc, final Change change) {
    super.onChange(bloc, change);
    dPrint.white('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onTransition(final Bloc bloc, final Transition transition) {
    super.onTransition(bloc, transition);
    dPrint.white('onTransition -- ${bloc.runtimeType}, $transition');
  }

  @override
  void onError(
    final BlocBase bloc,
    final Object error,
    final StackTrace stackTrace,
  ) {
    dPrint.error('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(final BlocBase bloc) {
    super.onClose(bloc);
    dPrint.warning('onClose -- ${bloc.runtimeType}');
  }
}
