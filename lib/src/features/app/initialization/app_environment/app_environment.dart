// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import '../../app.dart';


part 'app_environment.freezed.dart';
part 'app_environment.g.dart';

/// Базовые настройки конфигруации при запуске приложения
@freezed
class AppEnvironment with _$AppEnvironment {
  /// [buildType] - вид билда приложения
  /// [debugOptions] - набор debug-flutter настроек приложения
  /// [debugPaintOptions] - набор debug настроек отрисовки Flutter движка, позволяющие отлаживать различные моменты
  /// [logLevel] - минимальный логируемый уровень лог-системы приложения
  /// [enableBlocLogs] - параметр управляющий включением/выключением логов Bloc слоя
  /// [enableRoutingLogs] - параметр управляющий включением/выключением логов Routing слоя
  /// [enableDioLogs] - параметр управляющий включением/выключением логов http слоя
  /// [gRPCServerUrl] - параметр указывающий на URL сервера
  /// [dynamicLinkPattern] - паттерн диплинков
  /// [targetLinkPattern] - паттерн ссылок в репозитории диплинков
  const factory AppEnvironment({
    required BuildType buildType,
    required DebugOptions debugOptions,
    required DebugPaintOptions debugPaintOptions,
    required bool enableBlocLogs,
    required bool enableRoutingLogs,
    required bool enableDioLogs,
    required String gRPCServerUrl,
    required String dynamicLinkPattern,
    required String targetLinkPattern,
  }) = _AppEnvironment;

  factory AppEnvironment.fromJson(Map<String, dynamic> json) =>
      _$AppEnvironmentFromJson(json);
}