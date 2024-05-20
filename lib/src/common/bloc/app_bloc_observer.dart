import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

// TODO: переписать на новый логгер
class AppBlocObserver extends BlocObserver {
  AppBlocObserver({
    required bool isDebugMode,
  }) : _isDebugMode = isDebugMode;

  final bool _isDebugMode;
  final _logger = Logger();

  @override
  void onEvent(Bloc<Object?, Object?> bloc, Object? event) {
    super.onEvent(bloc, event);
    if (_isDebugMode) {
      _logger.i('Event | ${bloc.runtimeType} | $event');
    }
  }

  @override
  void onCreate(BlocBase<Object?> bloc) {
    super.onCreate(bloc);
    if (_isDebugMode) {
      _logger.i('Create | ${bloc.runtimeType}');
    }
  }

  @override
  void onChange(BlocBase<Object?> bloc, Change<Object?> change) {
    super.onChange(bloc, change);
    if (_isDebugMode) {
      _logger.i('Change | ${bloc.runtimeType} | $change');
    }
  }

  @override
  void onTransition(
      Bloc<Object?, Object?> bloc,
      Transition<Object?, Object?> transition,
      ) {
    super.onTransition(bloc, transition);
    final event = transition.event;
    final currentState = transition.currentState;
    final nextState = transition.nextState;
    if (event == null || currentState == null || nextState == null) {
      return;
    }
    if (_isDebugMode) {
      _logger.i(
        'Transition | ${bloc.runtimeType} | ${event.runtimeType}: ${currentState.runtimeType}->${nextState.runtimeType}',
      );
    }
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    if (_isDebugMode) {
      _logger.e('Error | ${bloc.runtimeType} | $error', stackTrace: stackTrace);
    }
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase<Object?> bloc) {
    super.onClose(bloc);
    if (_isDebugMode) {
      _logger.i('Close | ${bloc.runtimeType}');
    }
  }
}
