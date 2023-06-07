import 'package:flutter/material.dart';
import 'package:pet_app_win/config/theme/ligth_theme.dart';
import 'package:pet_app_win/data/dependency_injection/injection.dart';
import 'package:pet_app_win/presentation/screens/onboarding/onboarding_page.dart';

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
      debugShowCheckedModeBanner: false,
      theme: lightTheme(context),
      themeMode: ThemeMode.light,
      routes: getApplicationRoutes(),
      home: const OnboardingPage(),
    );
  }
}
