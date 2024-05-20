import 'package:freezed_annotation/freezed_annotation.dart';

part 'debug_option.freezed.dart';
part 'debug_option.g.dart';

/// Набор конифигурируемых опций, используемых в Flutter Application
@freezed
class DebugOptions with _$DebugOptions {
  const factory DebugOptions({
    @Default(false) bool showPerformanceOverlay,
    @Default(false) bool debugShowMaterialGrid,
    @Default(false) bool checkerboardRasterCacheImages,
    @Default(false) bool checkerboardOffscreenLayers,
    @Default(false) bool showSemanticsDebugger,
    @Default(false) bool debugShowCheckedModeBanner,
  }) = _DebugOptions;

  factory DebugOptions.fromJson(Map<String, dynamic> json) =>
      _$DebugOptionsFromJson(json);
}