// TODO: удалить если не будет использоваться

import 'package:fairwind/src/common/common.dart';
import 'package:flutter/foundation.dart';

/// Класс с приватным конструктором, хранящий в себе статики с платформой и ОС
class ClientPlatform {
  ClientPlatform._();

  /// Тип платформы
  static ClientPlatformType clientPlatformType = getRunningPlatformType();

  /// Тип ОС
  static ClientSubPlatformType clientSubPlatformType = getRunningSubPlatformType();

  static ClientPlatformType getRunningPlatformType() {
    if (kIsWeb) {
      return ClientPlatformType.web;
    }
    final platform = defaultTargetPlatform;
    switch (platform) {
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return ClientPlatformType.desktop;
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
        return ClientPlatformType.mobile;
      default:
        return ClientPlatformType.unknown;
    }
  }

  static ClientSubPlatformType getRunningSubPlatformType() {
    final platform = defaultTargetPlatform;
    if (platform == TargetPlatform.linux) {
      return ClientSubPlatformType.linux;
    } else if (platform == TargetPlatform.macOS) {
      return ClientSubPlatformType.macOS;
    } else if (platform == TargetPlatform.windows) {
      return ClientSubPlatformType.windows;
    } else if (platform == TargetPlatform.android) {
      return ClientSubPlatformType.android;
    } else if (platform == TargetPlatform.iOS) {
      return ClientSubPlatformType.ios;
    } else {
      return ClientSubPlatformType.unknown;
    }
  }
}

/// Платформа на которой запущено приложение
enum ClientPlatformType {
  mobile,
  desktop,
  web,
  unknown,
}
/// ОС на которой запущено приложение
enum ClientSubPlatformType {
  android,
  ios,
  fuchsia,
  macOS,
  linux,
  windows,
  unknown,
}