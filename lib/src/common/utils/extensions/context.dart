import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  // ТЕМА
  /// Extension for getting Theme
  ThemeData get theme => Theme.of(this);

  /// Extension for getting textTheme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Extension for getting textTheme
  TextStyle? get captionStyle => Theme.of(this).textTheme.bodySmall;

  ColorScheme get colors => theme.colorScheme;

  TextStyle? get displayLarge => textTheme.displayLarge?.copyWith(
        color: colors.onSurface,
      );

  TextStyle? get displayMedium => textTheme.displayMedium?.copyWith(
        color: colors.onSurface,
      );

  TextStyle? get displaySmall => textTheme.displaySmall?.copyWith(
        color: colors.onSurface,
      );

  TextStyle? get headlineLarge => textTheme.headlineLarge?.copyWith(
        color: colors.onSurface,
      );

  TextStyle? get headlineMedium => textTheme.headlineMedium?.copyWith(
        color: colors.onSurface,
      );

  TextStyle? get headlineSmall => textTheme.headlineSmall?.copyWith(
        color: colors.onSurface,
      );

  TextStyle? get titleLarge => textTheme.titleLarge?.copyWith(
        color: colors.onSurface,
      );

  TextStyle? get titleMedium => textTheme.titleMedium?.copyWith(
        color: colors.onSurface,
      );

  TextStyle? get titleSmall => textTheme.titleSmall?.copyWith(
        color: colors.onSurface,
      );

  TextStyle? get labelLarge => textTheme.labelLarge?.copyWith(
        color: colors.onSurface,
      );

  TextStyle? get labelMedium => textTheme.labelMedium?.copyWith(
        color: colors.onSurface,
      );

  TextStyle? get labelSmall => textTheme.labelSmall?.copyWith(
        color: colors.onSurface,
      );

  TextStyle? get bodyLarge => textTheme.bodyLarge?.copyWith(
        color: colors.onSurface,
      );

  TextStyle? get bodyMedium => textTheme.bodyMedium?.copyWith(
        color: colors.onSurface,
      );

  TextStyle? get bodySmall => textTheme.bodySmall?.copyWith(
        color: colors.onSurface,
      );

  /// The foreground color for widgets (knobs, text, overscroll edge effect, etc).
  /// Accent color is also known as the secondary color.
  Color get accentColor => theme.colorScheme.secondary;

  /// The background color for major parts of the app (toolbars, tab bars, etc).
  Color get primaryColor => theme.primaryColor;


  /// A color that contrasts with the [primaryColor].
  Color get backgroundColor => theme.colorScheme.background;

  /// The default color of [MaterialType.canvas] [Material].
  Color get canvasColor => theme.canvasColor;

  /// The default color of [MaterialType.card] [Material].
  Color get cardColor => theme.cardColor;

  /// The default brightness of the [Theme].
  Brightness get brightness => theme.brightness;

  /// If the [ThemeData] of the current [BuildContext] is dark
  bool get isDarkMode => theme.brightness == Brightness.dark;


  /// To get a [MediaQuery] directly.
  MediaQueryData get mq => MediaQuery.of(this);

  /// Get MediaQuery Screen Size
  Size get screenSize => mq.size;

  /// Get MediaQuery Screen Padding
  EdgeInsets get screenPadding => mq.padding;

  /// Get MediaQuery Screen Density
  double get screenDensity => mq.devicePixelRatio;

  /// Get MediaQuery Screen Width
  double get screenWidth => mq.size.width;

  /// Get MediaQuery Screen Height
  double get screenHeight => mq.size.height;

  ///Returns Orientation using [MediaQuery]
  Orientation get orientation => mq.orientation;

  /// Returns if Orientation is landscape
  bool get isLandscape => orientation == Orientation.landscape;
}
