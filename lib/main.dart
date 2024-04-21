import 'package:aksara_ebook_apps/model/insert_book.dart';
import 'package:flutter/material.dart';
import 'package:aksara_ebook_apps/l10n/l10n.dart';
import 'package:aksara_ebook_apps/routes/router.dart';
import 'package:aksara_ebook_apps/shared/app_text_styles.dart';
import 'package:aksara_ebook_apps/shared/app_theme_data.dart';

void main() {
  runApp(const App());
}
final appRouter = AppRouter();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      textTheme: AppTextStyles.style(context),
      child: MaterialApp.router(
        theme: larasThemeData(context),
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
