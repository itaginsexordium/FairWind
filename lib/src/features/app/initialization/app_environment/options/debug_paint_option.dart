import 'package:freezed_annotation/freezed_annotation.dart';

part 'debug_paint_option.freezed.dart';
part 'debug_paint_option.g.dart';

/// Дебаг-опции для настройки графической библиотеки (Skia, Impeller)
@freezed
class DebugPaintOptions with _$DebugPaintOptions {
  const factory DebugPaintOptions({
    @Default(false) bool debugPaintSizeEnabled,
    @Default(false) bool debugPaintBaselinesEnabled,
    @Default(false) bool debugPaintPointersEnabled,
    @Default(false) bool debugPaintLayerBordersEnabled,
    @Default(false) bool debugRepaintRainbowEnabled,
  }) = _DebugPaintOptions;

  factory DebugPaintOptions.fromJson(Map<String, dynamic> json) =>
      _$DebugPaintOptionsFromJson(json);
}