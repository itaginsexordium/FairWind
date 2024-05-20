import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'bloc_action_performer_mixin.dart';
import 'loadable_bloc.dart';


/* #region ActionState */
@immutable
sealed class ActionState<Result> implements LoadableState {
  const ActionState({
    this.data,
  });

  final Result? data;

  @override
  bool get isLoading => switch (this) {
        LoadingActionState() => true,
        ErrorActionState() => false,
        DataActionState() => false,
      };
}

@immutable
final class LoadingActionState<Result> extends ActionState<Result> {
  const LoadingActionState({super.data});
}

@immutable
final class ErrorActionState<Result> extends ActionState<Result> {
  const ErrorActionState({
    required this.error,
    super.data,
  });

  final Object error;
}

@immutable
final class DataActionState<Result> extends ActionState<Result> {
  const DataActionState({
    required this.data,
  });

  @override
  // ignore: overridden_fields
  final Result data;
}
/* #endregion */

/* #region ActionEvent */
@immutable
final class ActionEvent<Params> {
  const ActionEvent({
    required this.params,
    this.forceClear = false,
  });

  final Params params;
  final bool forceClear;
}
/* #endregion */

/// Блок для обработки асинхронного действия. Использует [droppable] в качестве
/// трансформера очередности событий.
///
/// Выполняет практически те же функции, что и [FutureBuilder]. Но имеет
/// некоторые преимущества:
/// - Автоматическая отправка логов через [BlocObserver].
/// - Возможность выполнять несколько раз [action].
/// - Контроль очередности вызовов обработки [action].
/// - Более гибкая работа с [State].
class ActionBloc<Params, Result>
    extends Bloc<ActionEvent<Params>, ActionState<Result>>
    with BlocActionPerformerMixin, LoadableBloc {
  ActionBloc({
    required Future<Result> Function(Params) action,
  })  : _action = action,
        super(LoadingActionState<Result>()) {
    on<ActionEvent<Params>>(
      _eventHandler,
      transformer: droppable(),
    );
  }

  final Future<Result> Function(Params) _action;

  /* #region Event handlers */
  Future<void> _eventHandler(
    ActionEvent<Params> event,
    Emitter<ActionState<Result>> emitter,
  ) async {
    await performSafeAction(
      () async {
        final data = await _action.call(event.params);

        emitter.call(DataActionState<Result>(data: data));
      },
      emitter,
      loadingState: () => LoadingActionState<Result>(
        data: event.forceClear ? null : state.data,
      ),
    );
  }
  /* #endregion */

  @override
  Future<void> handleError(
    Object error,
    StackTrace stackTrace,
    Emitter<ActionState<Result>> emitter,
  ) {
    emitter.call(
      ErrorActionState<Result>(
        error: error,
        data: state.data,
      ),
    );
    Error.throwWithStackTrace(error, stackTrace);
  }
}
