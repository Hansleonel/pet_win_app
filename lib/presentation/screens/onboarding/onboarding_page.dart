import 'package:flutter/material.dart';
import 'package:pet_app_win/config/theme/constants/constants.dart';
import 'package:pet_app_win/presentation/screens/register/pet_registration_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// TODO refactor OnboardingPage entire page
class OnboardingPage extends StatelessWidget {
  static const route = 'onboardingPage';
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    return PageView.builder(
      allowImplicitScrolling: true,
      physics: const ClampingScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Scaffold(
            body: OnboardingPageElement(
              title: lang.on_boarding_know_your_pet,
              subTitle: lang.on_boarding_register_your_pet_data,
              index: index,
            ),
          );
        } else if (index == 1) {
          return Scaffold(
            body: OnboardingPageElement(
              title: lang.on_boarding_never_miss_meal,
              subTitle: lang.on_boarding_get_feeding_reminders,
              index: index,
            ),
          );
        } else if (index == 2) {
          return Scaffold(
            body: OnboardingPageElement(
              title: 'Conecta con los mejores cuidadores y veterinarios',
              subTitle:
                  'Encuentra y contacta a los mejores cuidadores y veterinarios locales con calificaciones y reseñas.',
              index: index,
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}

class OnboardingPageElement extends StatelessWidget {
  final int index;
  final String title;
  final String subTitle;
  const OnboardingPageElement({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PetWin',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 200,
                child:
                    Image.asset('assets/images/onboarding_0${index + 1}.png')),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Text(title, style: titleStyle, textAlign: TextAlign.center),
            ),
            const SizedBox(height: 8.0),
            Text(
              subTitle,
              style: const TextStyle(color: blackColor80),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
      bottomNavigationBar: index == 2
          ? Padding(
              padding: const EdgeInsets.only(
                  top: 16, bottom: 24, right: 16, left: 16),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, PetRegistrationPage.route);
                },
                child: const Text('EMPEZAR'),
              ),
            )
          : null,
    );
  }
}
