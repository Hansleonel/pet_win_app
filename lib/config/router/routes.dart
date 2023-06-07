import 'package:flutter/material.dart';
import 'package:pet_app_win/presentation/screens/onboarding/onboarding_page.dart';
import 'package:pet_app_win/presentation/screens/register/pet_registration_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    OnboardingPage.route: (context) => const OnboardingPage(),
    PetRegistrationPage.route: (context) => const PetRegistrationPage(),
  };
}
