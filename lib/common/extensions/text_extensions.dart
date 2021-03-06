import 'package:flutter/material.dart';
import 'package:movies_tmdb/presentation/themes/theme_color.dart';

extension ThemeTextExtension on TextTheme {
  TextStyle get royalBlueSubtitle1 => subtitle1.copyWith(
        color: AppColor.royalBlue,
        fontWeight: FontWeight.w600,
      );
  TextStyle get greySubtitle1 => subtitle1.copyWith(
        color: Colors.grey,
      );
  TextStyle get violetHeadline6 => subtitle1.copyWith(
        color: AppColor.violet,
      );
}
