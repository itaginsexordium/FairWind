import 'package:freezed_annotation/freezed_annotation.dart';

/// Build type of application - debug or release
enum BuildType {
  /// Debug build type
  @JsonValue('debug')
  debug,

  /// Release build type
  @JsonValue('release')
  release,
}