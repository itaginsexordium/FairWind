import 'dart:async';

import 'package:fairwind/src/common/common.dart';
import 'package:fairwind/src/features/app/app.dart';
import 'package:flutter/foundation.dart';
import 'package:l/l.dart';

/// Точка запуска основного приложения, версия demo
void main() => l.capture<void>(
      () {
    runZonedGuarded<void>(
          () {
        // получаем из env нужны ли встроенные дебаг инструменты
        const debugInstrumentsEnv =
        bool.fromEnvironment('debugInstruments');
        // определяем вид билда приложения
        const buildType = !kReleaseMode || debugInstrumentsEnv
            ? BuildType.debug
            : BuildType.release;
        Runner.run(const AppEnvironment(
            buildType: buildType,
            debugOptions: DebugOptions(
              debugShowCheckedModeBanner: false,
            ),
            debugPaintOptions: DebugPaintOptions(),
            enableBlocLogs: false,
            enableRoutingLogs: false,
            enableDioLogs: false,
            gRPCServerUrl: '',
            dynamicLinkPattern: '',
            targetLinkPattern: ''));
      },
      // Логируем ошибки зоны
      l.e,
    );
  },
  const LogOptions(
    handlePrint: true,
    messageFormatting: LoggerUtil.messageFormatting,
    outputInRelease: false,
    printColors: true,
  ),
);