// ignore_for_file: avoid_classes_with_only_static_members, constant_identifier_names, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
import 'dimensions.dart';

abstract class FontConstants {
  static final chewy = GoogleFonts.chewy().fontFamily;
}

abstract class TextStyles {
  static TextStyle textBold = TextStyle(
    fontFamily: FontConstants.chewy,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.text_xxlarge,
    color: AppColors.primary,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle textNormal = TextStyle(
    fontFamily: FontConstants.chewy,
    fontWeight: FontWeight.normal,
    fontSize: Dimens.text_normal,
    color: AppColors.primary,
    overflow: TextOverflow.ellipsis,
  );

}