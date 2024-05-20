// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  // цвета
  static const c_white = Color(0xFFFFFFFF);
  static const c_text_1 = Color(0xFF323746);
  static const c_text_2 = Color(0xFF575B68);
  static const c_text_3 = Color(0xFFA8A9AD);
  static const c_text_4 = Color(0xFFDFE0E1);
  static const c_background = Color(0xFFDFE0E1);
  static const c_blue = Color(0xFF4483FD);
  static const c_pink = Color(0xFFFF708B);
  static const c_pink_2 = Color(0xFFDA3BEC);
  static const c_violet = Color(0xFFDA3BEC);
  static final c_blue_with_40_opacity = c_blue.withOpacity(0.4);
  static final c_blue_with_10_Opacity = c_blue.withOpacity(0.1);

  // шрифты
  static final ts_24_bold_outfit = GoogleFonts.outfit(
    fontWeight: FontWeight.w700,
    fontSize: 24,
    color: c_text_1,
  );

  static final ts_24_bold_exo2 = GoogleFonts.exo2(
    fontWeight: FontWeight.w700,
    fontSize: 24,
    color: c_text_1,
  );

  static final ts_20_semi_bold_exo2 = GoogleFonts.exo2(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: c_text_1,
  );

  static final ts_16_semi_bold_exo2 = GoogleFonts.exo2(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: c_text_1,
  );

  static final ts_16_medium_exo2 = GoogleFonts.exo2(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: c_text_1,
  );

  static final ts_16_regular_exo2 = GoogleFonts.exo2(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: c_text_1,
  );

  static final ts_14_semi_bold_exo2 = GoogleFonts.exo2(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: c_text_1,
  );

  static final ts_14_medium_exo2 = GoogleFonts.exo2(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: c_text_1,
  );

  static final ts_14_regular_exo2 = GoogleFonts.exo2(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: c_text_1,
  );

  static final ts_12_regular_exo2 = GoogleFonts.exo2(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: c_text_1,
  );

  static final ts_10_regular_exo2 = GoogleFonts.exo2(
    fontWeight: FontWeight.w400,
    fontSize: 10,
    color: c_text_1,
  );
  

}
