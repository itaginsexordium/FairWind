import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fairwind/src/common/common.dart';
import 'package:fairwind/src/features/app/app.dart';

/// Инициализация приложения перед запуском
Future<void> bootstrap({
  required AppEnvironment appEnvironment,
  required Future<Widget> Function() appRunner,
}) async {
  // Логгирование ошибок фреймворка и платформы
  try {
    WidgetsFlutterBinding.ensureInitialized();

    // TODO: проверить, нужен ли WidgetsFlutterBinding.ensureInitialized().deferFirstFrame();
    // позволяет до вызова метода allowFirstFrame не отправлять первые кадры
    // в движок дает выполнить асинхронную инициализацию перед тем, как будет
    // отрендерен первый кадр (что уберет заставку)
    // сравнить с другими вариантами показа сплэш страницы

    PlatformDispatcher.instance.onError = (error, stackTrace) {
      ErrorUtil.logError(
        error,
        stackTrace,
        hint: 'ROOT | ${Error.safeToString(error)}',
      ).ignore();
      return true;
    };

    final sourceFlutterError = FlutterError.onError;
    FlutterError.onError = (final details) {
      ErrorUtil.logError(
        details.exception,
        details.stack ?? StackTrace.current,
        hint: 'FLUTTER ERROR\r\n$details',
      ).ignore();
      // FlutterError.presentError(details);
      sourceFlutterError?.call(details);
    };
  } on Object catch (error, stackTrace) {
    ErrorUtil.logError(error, stackTrace).ignore();
  }

  if (appEnvironment.enableBlocLogs) {
    Bloc.observer = AppBlocObserver(isDebugMode: kDebugMode);
  }
  runApp(await appRunner());
}
