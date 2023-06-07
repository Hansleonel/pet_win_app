import 'package:flutter/material.dart';
import 'package:pet_app_win/config/theme/constants/constants.dart';

class PetRegistrationPage extends StatelessWidget {
  static const route = 'petRegistrationPage';
  const PetRegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Scaffold(
      appBar: AppBar(
        title: const AppBarStepper(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Text(
                'Cuentanos acerca de tus Mascota',
                style: titleStyle,
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Ayúdanos a conocer mejor a tu mascota. Nuestra inteligencia artificial utilizará esta información para personalizar las recomendaciones de cuidado y nutrición para tu mascota.',
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarStepper extends StatelessWidget {
  const AppBarStepper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 96),
        Container(
          width: 32.0,
          height: 4.0,
          decoration: const BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(4.0),
            ),
          ),
        ),
        const SizedBox(width: 4),
        Container(
          width: 32.0,
          height: 4.0,
          decoration: const BoxDecoration(
            color: greyColor,
            borderRadius: BorderRadius.all(
              Radius.circular(4.0),
            ),
          ),
        ),
      ],
    );
  }
}
