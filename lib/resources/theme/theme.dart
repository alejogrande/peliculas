import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peliculas/resources/colors.dart';

ThemeData theme(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    secondaryHeaderColor: Colors.red,
    cardColor: AppColors.card,
    disabledColor: AppColors.disabledButton,
    hintColor: AppColors.fontSubtitle,
    indicatorColor: AppColors.primary,
    primaryColor: AppColors.primary,
    primaryIconTheme: const IconThemeData(
      color: AppColors.fontTitle,
    ),
    // primaryColor: AppColors.primary,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primary,
    ),
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      color: AppColors.black2,
      elevation: 0,
      // centerTitle: false,
    ),
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      displayLarge: GoogleFonts.poppins(
        color: AppColors.fontTitle,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      displayMedium: GoogleFonts.poppins(
        color: AppColors.fontTitle,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      displaySmall: GoogleFonts.poppins(
        color: AppColors.fontTitle,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: GoogleFonts.poppins(
        color: AppColors.fontTitle,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: GoogleFonts.poppins(
        color: AppColors.fontTitle,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: GoogleFonts.poppins(
        color: AppColors.fontTitle,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.normal,
      ),
      titleMedium: GoogleFonts.poppins(
        color: AppColors.fontSubtitle,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      titleSmall: GoogleFonts.poppins(
        color: AppColors.fontSubtitle,
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      labelLarge: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(
          primary: AppColors.primary,
          secondary: AppColors.secondary, // Your accent color
        )
        .copyWith(background: AppColors.background)
        .copyWith(error: AppColors.error),
  );
}
