import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart'
    show BuildContext, Colors, ScaffoldMessenger, SnackBar, Text;
import 'package:l/l.dart';

import '../utils.dart';
import 'platform/error_util_vm.dart'
// ignore: uri_does_not_exist
    if (dart.library.html) 'platform/error_util_js.dart';

/// Утилита ошибок
sealed class ErrorUtil {
  /// Записать ошибку в консоль и в Crashlytics
  static Future<void> logError(
    Object exception,
    StackTrace stackTrace, {
    String? hint,
    bool fatal = false,
  }) async {
    try {
      if (exception is String) {
        return await logMessage(
          exception,
          stackTrace: stackTrace,
          hint: hint,
          warning: true,
        );
      }
      captureException(exception, stackTrace, hint, fatal).ignore();
      l.e(exception, stackTrace);
    } on Object catch (error, stackTrace) {
      // TODO: добавить локализацию ошибки
      l.e(
        'Error while logging error "$error" inside ErrorUtil.logError',
        stackTrace,
      );
    }
  }

  /// Записывает сообщение в консоль и в Crashlytics
  static Future<void> logMessage(
    String message, {
    StackTrace? stackTrace,
    String? hint,
    bool warning = false,
  }) async {
    try {
      l.e(message, stackTrace ?? StackTrace.current);
      captureMessage(message, stackTrace, hint, warning).ignore();
    } on Object catch (error, stackTrace) {
      // TODO: добавить локализацию ошибки
      l.e(
        'Error while logging error "$error" inside ErrorUtil.logMessage',
        stackTrace,
      );
    }
  }

  /// Повторно выбрасывает ошибку с трассировкой стека
  static Never throwWithStackTrace(Object error, StackTrace stackTrace) =>
      Error.throwWithStackTrace(error, stackTrace);

  @pragma('vm:prefer-inline')
  static String _localizedError(
      String fallback, String Function(S l) localize) {
    try {
      return localize(S.current);
    } on Object {
      return fallback;
    }
  }

  // Также мы можем добавить текущую локализацию к этому методу
  static String formatMessage(
    Object error, [
    String fallback = 'An error has occurred',
  ]) =>
      switch (error) {
        String e => e,
        FormatException _ =>
          _localizedError('Invalid format', (l) => l.errInvalidFormat),
        TimeoutException _ =>
          _localizedError('Timeout exceeded', (l) => l.errTimeOutExceeded),
        UnimplementedError _ =>
          _localizedError('Not implemented yet', (l) => l.errNotImplementedYet),
        UnsupportedError _ => _localizedError(
            'Unsupported operation', (l) => l.errUnsupportedOperation),
        FileSystemException _ =>
          _localizedError('File system error', (l) => l.errFileSystemException),
        AssertionError _ =>
          _localizedError('Assertion error', (l) => l.errAssertionError),
        Error _ => _localizedError(
            'An error has occurred', (l) => l.errAnErrorHasOccurred),
        Exception _ => _localizedError(
            'An exception has occurred', (l) => l.errAnExceptionHasOccurred),
        _ => fallback,
      };

  /// Показывает снэкбар с ошибкой с заданным сообщением
  static void showSnackBar(BuildContext context, Object message) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(formatMessage(message)),
          // TODO: передать цвет из темы
          backgroundColor: Colors.red,
        ),
      );
}
