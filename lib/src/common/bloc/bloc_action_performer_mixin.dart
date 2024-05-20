import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin BlocActionPerformerMixin<State> on BlocBase<State> {
  Future<void> handleError(
    Object error,
    StackTrace stackTrace,
    Emitter<State> emitter,
  );

  Future<void> performSafeAction(
    AsyncCallback callback,
    Emitter<State> emitter, {
    ValueGetter<State>? loadingState,
    ValueGetter<State>? idleState,
  }) async {
    try {
      final loading = loadingState?.call();
      if (loading != null) {
        emitter.call(loading);
      }

      await callback();
    } catch (error, stackTrace) {
      // TODO: асинхронные операции пока не захватывают стектрейс.
      // Придумать альтернативу пока в дарт не добавят эту возможность.
      // https://github.com/dart-lang/sdk/issues/46318
      await handleError(error, stackTrace, emitter);
    } finally {
      final idle = idleState?.call();
      if (idle != null) {
        emitter.call(idle);
      }
    }
  }
}
