import 'package:flutter/material.dart';
import 'package:aksara_ebook_apps/shared/app_text_styles.dart';
import 'package:aksara_ebook_apps/shared/app_theme_data.dart';

// Extension on BuildContext for easy theme access
extension CustomThemeExtension on BuildContext {
  AppTextStyles get textTheme {
    final theme = AppTheme.of(this);
    assert(theme != null, 'No AppTheme found in context');
    return theme!.textTheme;
  }
}
