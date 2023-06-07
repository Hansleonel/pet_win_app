import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_app_win/config/theme/constants/constants.dart';
import 'package:pet_app_win/presentation/bloc/onboarding_bloc/onboarding_bloc.dart';
import 'package:pet_app_win/presentation/widgets/pet_input_field.dart';

import '../../../data/dependency_injection/injection.dart';
import '../../bloc/provider/provider.dart';

class PetRegistrationPage extends StatefulWidget {
  static const route = 'petRegistrationPage';

  const PetRegistrationPage({Key? key}) : super(key: key);

  @override
  State<PetRegistrationPage> createState() => _PetRegistrationPageState();
}

class _PetRegistrationPageState extends State<PetRegistrationPage> {
  final OnboardingBloc? onboardingBloc =
      Provider.of<OnboardingBloc>(() => getIt.get<OnboardingBloc>());
  TextEditingController namePetCntrl = TextEditingController();
  TextEditingController dateBirthCntrl = TextEditingController();
  TextEditingController razaCntrl = TextEditingController();

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Cuentanos acerca de tus Mascota',
                  style: titleStyle,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Ayúdanos a conocer mejor a tu mascota. Nuestra inteligencia artificial utilizará esta información para personalizar las recomendaciones de cuidado y nutrición para tu mascota.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              Text(
                'Que tipo de mascota tienes?',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8.0),
              StreamBuilder<int>(
                stream: onboardingBloc!.petSelected,
                initialData: 0,
                builder: (context, snapshot) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ItemPetRegistration(
                        idPet: 1,
                        title: 'Perrito',
                        icon: 'dog',
                        bloc: onboardingBloc!,
                        isSelectedItem: (snapshot.data == 1),
                      ),
                      ItemPetRegistration(
                        idPet: 2,
                        title: 'gatito',
                        icon: 'cat',
                        bloc: onboardingBloc!,
                        isSelectedItem: (snapshot.data == 2),
                      ),
                      ItemPetRegistration(
                        idPet: 3,
                        title: 'otro',
                        icon: 'bird',
                        bloc: onboardingBloc!,
                        isSelectedItem: (snapshot.data == 3),
                      )
                    ],
                  );
                },
              ),
              const SizedBox(height: 8),
              const Divider(
                color: Colors.grey,
                height: 8.0, // Tú puedes ajustar esta altura a lo que necesites
                // Este es el grosor de la línea
              ),
              const SizedBox(height: 16),
              Text(
                'Acerca de tu mascota',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              const PetAvatar(),
              const SizedBox(height: 16),
              const Text(
                'Nombre de tu amiguito',
                style: TextStyle(color: blackColor60),
              ),
              const SizedBox(height: 4),
              PetInputField(
                textEditingController: namePetCntrl,
                keyboardType: TextInputType.name,
                hintText: 'Don Pedrito',
                prefixIcon: 'assets/icons/FaceId.svg',
                errorText: 'min 3 caracteres',
              ),
              const SizedBox(height: 8),
              const Text(
                'Edad de tu amiguito',
                style: TextStyle(color: blackColor60),
              ),
              const SizedBox(height: 4),
              PetInputField(
                textEditingController: dateBirthCntrl,
                keyboardType: TextInputType.name,
                hintText: '6 meses',
                prefixIcon: 'assets/icons/FaceId.svg',
                errorText: 'intenta ser exacto',
              ),
              const Text(
                'Raza de tu amiguito',
                style: TextStyle(color: blackColor60),
              ),
              const SizedBox(height: 4),
              PetInputField(
                textEditingController: razaCntrl,
                keyboardType: TextInputType.name,
                hintText: 'Criollo',
                prefixIcon: 'assets/icons/FaceId.svg',
                errorText: 'intenta ser exacto',
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(top: 16, bottom: 24, right: 16, left: 16),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, PetRegistrationPage.route);
          },
          child: const Text('EMPEZAR'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    namePetCntrl.dispose();
    dateBirthCntrl.dispose();
    razaCntrl.dispose();
    super.dispose();
  }
}

class PetAvatar extends StatelessWidget {
  const PetAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          const CircleAvatar(
            radius: 64,
            backgroundImage: NetworkImage(
              'https://img.freepik.com/fotos-premium/ai-genero-retrato-raza-perro-chihuahua-lindo-feliz-emocionado-sonriendo_441362-3146.jpg',
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.camera_alt,
                  color: whiteColor,
                ),
                onPressed: () {
                  // Aquí va la funcionalidad para subir la foto
                },
              ),
            ),
          ),
        ],
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

class ItemPetRegistration extends StatelessWidget {
  final int idPet;
  final String title;
  final String icon;
  final OnboardingBloc bloc;
  final bool? isSelectedItem;
  const ItemPetRegistration({
    Key? key,
    required this.idPet,
    required this.title,
    required this.icon,
    required this.bloc,
    this.isSelectedItem = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: isSelectedItem! ? primaryColor : greyColor)),
          width: 106,
          height: 116,
          child: Column(
            children: [
              const SizedBox(height: 16),
              SvgPicture.asset(
                "assets/icons/$icon.svg",
                height: 64,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.labelLarge,
              )
            ],
          ),
        ),
      ),
      onTap: () {
        if (idPet == 1) {
          bloc.setPetSelected = 1;
        } else if (idPet == 2) {
          bloc.setPetSelected = 2;
        } else if (idPet == 3) {
          bloc.setPetSelected = 3;
        }
      },
    );
  }
}
