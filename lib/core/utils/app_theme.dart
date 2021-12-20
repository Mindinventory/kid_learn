import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
import 'dimensions.dart';

class AppTheme {
  late Brightness brightness;

  Color get primaryColor => AppColors.primary;

  Color get accentColor => AppColors.primary;

  Color get darkAccentColor => AppColors.scaffoldBackgroundColor;

  Color get darkPrimaryColor => AppColors.primary;

  Color get indicatorColor => const Color(0xff0E1D36);

  Color get buttonColor => const Color(0xff3B3B3B);

  Color get hintColor => const Color(0xff280C0B);

  Color get highlightColor => const Color(0xff372901);

  Color get hoverColor => const Color(0xff3A3A3B);

  Color get focusColor => const Color(0xff0B2512);

  Color get disabledColor => Colors.grey;

  Color get textSelectionColor => Colors.black;

  Color get cardColor => const Color(0xFF151515);

  ThemeData get lightTheme {
    final theme = ThemeData.light();
    return ThemeData.light().copyWith(
      brightness: Brightness.light,
      primaryColor: primaryColor,
      primaryColorDark: AppColors.primary,
      primaryColorLight: AppColors.primary,
      highlightColor: AppColors.primary,
      backgroundColor: AppColors.scaffoldBackgroundColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryTextTheme: TextTheme(
        button: theme.primaryTextTheme.button?.copyWith(
          color: AppColors.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) {
              return states.contains(MaterialState.disabled)
                  ? AppColors.black.withOpacity(0.2)
                  : AppColors.black;
            },
          ),
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>((states) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.radius_small),
            );
          }),
        ),
      ),
    );
  }

  ThemeData get darkTheme {
    final theme = ThemeData.dark();
    return ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      primaryColorDark: AppColors.primary,
      primaryColorLight: AppColors.primary,
      highlightColor: AppColors.primary,
      backgroundColor: AppColors.scaffoldBackgroundColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryTextTheme: TextTheme(
          button:
              theme.primaryTextTheme.button?.copyWith(color: AppColors.white)),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) {
              return states.contains(MaterialState.disabled)
                  ? AppColors.black.withOpacity(0.2)
                  : AppColors.black;
            },
          ),
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>((states) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.radius_small),
            );
          }),
        ),
      ),
    );
  }

  ThemeData get theme {
    return lightTheme;
  }
}
