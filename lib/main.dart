import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pet_app_win/config/theme/ligth_theme.dart';
import 'package:pet_app_win/data/dependency_injection/injection.dart';
import 'package:pet_app_win/presentation/screens/onboarding/onboarding_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'config/router/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planet App',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('es'), // Spanish
      ],
      debugShowCheckedModeBanner: false,
      theme: lightTheme(context),
      themeMode: ThemeMode.light,
      routes: getApplicationRoutes(),
      home: const OnboardingPage(),
    );
  }
}
