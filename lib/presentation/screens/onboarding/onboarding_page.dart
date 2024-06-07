import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pet_app_win/config/theme/constants/constants.dart';
import 'package:pet_app_win/presentation/screens/register/pet_registration_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// TODO refactor OnboardingPage entire page
class OnboardingPage extends StatefulWidget {
  static const route = 'onboardingPage';
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final PageController _pageController;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 4), (timer) {
      if (_pageController.page!.round() < 2) {
        _pageController.animateToPage(
          _pageController.page!.round() + 1,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      } else {
        _pageController.animateToPage(
          _pageController.initialPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'PetWin',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: PageView.builder(
          controller: _pageController,
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
                  title: lang.on_boarding_connect_care_givers,
                  subTitle: lang.on_boarding_find_care_givers,
                  index: index,
                ),
              );
            }
            return const SizedBox();
          },
        ),
        bottomNavigationBar: Padding(
          padding:
              const EdgeInsets.only(top: 16, bottom: 24, right: 16, left: 16),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, PetRegistrationPage.route);
            },
            child: const Text(
              'EMPEZAR',
              style: TextStyle(color: whiteColor),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
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
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 200,
              child: Image.asset('assets/images/onboarding_0${index + 1}.png')),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title, style: titleStyle, textAlign: TextAlign.center),
          ),
          const SizedBox(height: 8.0),
          Text(
            subTitle,
            style: const TextStyle(color: blackColor80),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
