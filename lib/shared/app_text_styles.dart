import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aksara_ebook_apps/shared/color_values.dart';

const largeFontSize = 22.0;
const mediumFontSize = 18.0;
const smallFontSize = 14.0;
const bold = FontWeight.w700;
const semiBold = FontWeight.w600;
const brightTextColor = ColorValues.secondaryText50;

class AppTextStyles extends TextTheme {
  const AppTextStyles({
    required this.context,
    required this.titleSmallBright,
    required this.titleMediumBright,
    required this.titleLargeBright,
    required this.bodyMediumBright,
    required this.bodyMediumSemiBold,
    required this.bodyMediumSemiBoldBright,
    required this.bodyMediumBold,
    required this.bodyMediumBoldBright,
    required this.bodySmallBright,
    required this.bodySmallSemiBold,
    required this.bodySmallSemiBoldBright,
    required this.bodySmallBold,
    required this.bodySmallBoldBright,
  });

  factory AppTextStyles.style(BuildContext context) {
    final titleSmallBright = GoogleFonts.plusJakartaSans(
      color: brightTextColor,
      fontSize: smallFontSize,
      fontWeight: bold,
    );
    final titleMediumBright = GoogleFonts.plusJakartaSans(
      color: brightTextColor,
      fontSize: mediumFontSize,
      fontWeight: bold,
    );
    final titleLargeBright = GoogleFonts.plusJakartaSans(
      color: brightTextColor,
      fontSize: largeFontSize,
      fontWeight: bold,
    );

    final bodyMediumBright = GoogleFonts.plusJakartaSans(
      color: brightTextColor,
      fontSize: mediumFontSize,
      fontWeight: FontWeight.w500,
    );
    final bodyMediumSemiBold = GoogleFonts.plusJakartaSans(
      color: ColorValues.text50,
      fontSize: mediumFontSize,
      fontWeight: semiBold,
    );
    final bodyMediumSemiBoldBright = bodyMediumSemiBold.copyWith(
      color: brightTextColor,
    );
    final bodyMediumBold = GoogleFonts.plusJakartaSans(
      color: ColorValues.text50,
      fontSize: mediumFontSize,
      fontWeight: bold,
    );
    final bodyMediumBoldBright = bodyMediumBold.copyWith(
      color: brightTextColor,
    );

    final bodySmallBright = GoogleFonts.plusJakartaSans(
      color: brightTextColor,
      fontSize: smallFontSize,
      fontWeight: FontWeight.w500,
    );
    final bodySmallSemiBold = GoogleFonts.plusJakartaSans(
      color: ColorValues.text50,
      fontSize: smallFontSize,
      fontWeight: semiBold,
    );
    final bodySmallSemiBoldBright = bodySmallSemiBold.copyWith(
      color: brightTextColor,
    );
    final bodySmallBold = GoogleFonts.plusJakartaSans(
      color: ColorValues.text50,
      fontSize: smallFontSize,
      fontWeight: bold,
    );
    final bodySmallBoldBright = bodySmallBold.copyWith(
      color: brightTextColor,
    );

    return AppTextStyles(
      context: context,
      bodyMediumSemiBold: bodyMediumSemiBold,
      bodyMediumSemiBoldBright: bodyMediumSemiBoldBright,
      bodyMediumBold: bodyMediumBold,
      bodyMediumBoldBright: bodyMediumBoldBright,
      bodySmallSemiBold: bodySmallSemiBold,
      bodySmallSemiBoldBright: bodySmallSemiBoldBright,
      bodySmallBold: bodySmallBold,
      bodySmallBoldBright: bodySmallBoldBright,
      bodyMediumBright: bodyMediumBright,
      bodySmallBright: bodySmallBright,
      titleLargeBright: titleLargeBright,
      titleMediumBright: titleMediumBright,
      titleSmallBright: titleSmallBright,
    );
  }

  final BuildContext context;
  final TextStyle titleSmallBright;
  final TextStyle titleMediumBright;
  final TextStyle titleLargeBright;
  final TextStyle bodyMediumBright;
  final TextStyle bodyMediumSemiBold;
  final TextStyle bodyMediumSemiBoldBright;
  final TextStyle bodyMediumBold;
  final TextStyle bodyMediumBoldBright;
  final TextStyle bodySmallBright;
  final TextStyle bodySmallSemiBold;
  final TextStyle bodySmallSemiBoldBright;
  final TextStyle bodySmallBold;
  final TextStyle bodySmallBoldBright;

  @override
  TextStyle get displayLarge => GoogleFonts.plusJakartaSans(
    color: ColorValues.text50,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  @override
  TextStyle get displayMedium => GoogleFonts.plusJakartaSans(
    color: ColorValues.text50,
    fontSize: 19,
    fontWeight: FontWeight.w300,
  );

  @override
  TextStyle get displaySmall => GoogleFonts.plusJakartaSans(
    color: ColorValues.text50,
    fontSize: 13,
    fontWeight: FontWeight.bold,
  );

  @override
  TextStyle get headlineMedium => GoogleFonts.plusJakartaSans(
    color: ColorValues.text50,
    fontSize: 34,
    fontWeight: FontWeight.w400,
  );

  @override
  TextStyle get headlineSmall => GoogleFonts.plusJakartaSans(
    color: ColorValues.text50,
    fontSize: 24,
    fontWeight: FontWeight.w400,
  );

  @override
  TextStyle get titleLarge => GoogleFonts.plusJakartaSans(
    color: ColorValues.text50,
    fontSize: largeFontSize,
    fontWeight: FontWeight.w700,
  );

  @override
  TextStyle get titleMedium => GoogleFonts.plusJakartaSans(
    color: ColorValues.text50,
    fontSize: mediumFontSize,
    fontWeight: FontWeight.w700,
  );

  @override
  TextStyle get titleSmall => GoogleFonts.plusJakartaSans(
    color: ColorValues.text50,
    fontSize: smallFontSize,
    fontWeight: FontWeight.w700,
  );

  @override
  TextStyle get bodyLarge => GoogleFonts.plusJakartaSans(
    color: ColorValues.text50,
    fontSize: largeFontSize,
    fontWeight: FontWeight.w500,
  );

  @override
  TextStyle get bodyMedium => GoogleFonts.plusJakartaSans(
    color: ColorValues.text50,
    fontSize: mediumFontSize,
    fontWeight: FontWeight.w500,
  );

  @override
  TextStyle get bodySmall => GoogleFonts.plusJakartaSans(
    color: ColorValues.grey30,
    fontSize: smallFontSize,
    fontWeight: FontWeight.w500,
  );

  @override
  TextStyle get labelLarge => GoogleFonts.plusJakartaSans(
    color: ColorValues.text50,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  @override
  TextStyle get labelSmall => GoogleFonts.plusJakartaSans(
    color: ColorValues.primary50,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}
