import 'package:flutter/material.dart';

/// Сборщик множества [Future] внутри себя и сигнализирует о наличии
/// выполняющихся внутри [Future].
class FutureQueue {
  FutureQueue({
    required ValueSetter<bool> onUpdate,
  }) : _onUpdate = onUpdate;

  final ValueSetter<bool> _onUpdate;

  bool _isProcessing = false;
  final _futuresQueue = <Future<Object?>>{};

  /// Выполняется ли в данный момент в куче какая либо [Future].
  bool get isProcessing => _isProcessing;

  /// Добавить в кучу новую [Future]. По завершении выполнения, если в куче
  /// не окажется выполняемых [Future], вызовет слушателя [_onUpdate].
  void add(Future<Object?> future) {
    _updateState(true);

    _futuresQueue.add(future);

    future.whenComplete(() => _listener(future));
  }

  void _listener(Future<Object?> future) {
    _futuresQueue.remove(future);

    if (_futuresQueue.isEmpty) {
      _updateState(false);
    }
  }

  void _updateState(bool value) {
    if (_isProcessing != value) {
      _isProcessing = value;
      _onUpdate(_isProcessing);
    }
  }
}
