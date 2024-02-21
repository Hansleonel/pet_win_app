import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_app_win/config/theme/constants/constants.dart';
import 'package:pet_app_win/presentation/bloc/onboarding_bloc/onboarding_bloc.dart';
import 'package:pet_app_win/presentation/widgets/pet_input_field.dart';
import 'package:pet_app_win/presentation/widgets/shared/pet_divider.dart';

import '../../../data/dependency_injection/injection.dart';
import '../../bloc/provider/provider.dart';
import '../../widgets/shared/app_bar_stepper.dart';
import '../../widgets/shared/pet_avatar.dart';
import '../../widgets/shared/pet_button_selectable.dart';

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
  TextEditingController raceCntrl = TextEditingController();
  TextEditingController weightCntrl = TextEditingController();
  TextEditingController behaviorCntrl = TextEditingController();
  TextEditingController careCntrl = TextEditingController();
  TextEditingController medicCntrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const AppBarStepper(
            orderActivate: 1,
          ),
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
                  '¿Qué tipo de mascota tienes?',
                  style: Theme.of(context).textTheme.titleLarge,
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
                          title: 'Gatito',
                          icon: 'cat',
                          bloc: onboardingBloc!,
                          isSelectedItem: (snapshot.data == 2),
                        ),
                        ItemPetRegistration(
                          idPet: 3,
                          title: 'Otro',
                          icon: 'bird',
                          bloc: onboardingBloc!,
                          isSelectedItem: (snapshot.data == 3),
                        )
                      ],
                    );
                  },
                ),
                const SizedBox(height: 8),
                const PetDivider(),
                const SizedBox(height: 16),
                Text(
                  'Acerca de tu mascota',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                const PetAvatar(),
                const SizedBox(height: 16),
                const Text(
                  'Nombre de tu amiguito',
                  style: TextStyle(color: blackColor80),
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
                  'Su edad',
                  style: TextStyle(color: blackColor80),
                ),
                const SizedBox(height: 4),
                PetInputField(
                  textEditingController: dateBirthCntrl,
                  keyboardType: TextInputType.name,
                  hintText: '6 años y 9 meses',
                  prefixIcon: 'assets/icons/FaceId.svg',
                  errorText: 'intenta ser exacto',
                ),
                const SizedBox(height: 8),
                const Text(
                  'Su raza',
                  style: TextStyle(color: blackColor80),
                ),
                const SizedBox(height: 4),
                PetInputField(
                  textEditingController: raceCntrl,
                  keyboardType: TextInputType.name,
                  hintText: 'Criollo',
                  prefixIcon: 'assets/icons/FaceId.svg',
                  errorText: 'intenta ser exacto',
                ),
                const SizedBox(height: 8),
                const Text(
                  'Su Peso',
                  style: TextStyle(color: blackColor80),
                ),
                const SizedBox(height: 4),
                PetInputField(
                  textEditingController: weightCntrl,
                  keyboardType: TextInputType.text,
                  hintText: 'Pesa 4kg y 90 gramos',
                  prefixIcon: 'assets/icons/FaceId.svg',
                  errorText: 'intenta ser exacto',
                ),
                const SizedBox(height: 8),
                const Text(
                  'Su comportamiento',
                  style: TextStyle(color: blackColor80),
                ),
                const SizedBox(height: 4),
                PetInputField(
                  textEditingController: behaviorCntrl,
                  keyboardType: TextInputType.text,
                  hintText: 'Es jugueton y amigable',
                  prefixIcon: 'assets/icons/FaceId.svg',
                  errorText: 'intenta ser exacto',
                ),
                const SizedBox(height: 8),
                const PetDivider(height: 24),
                Text(
                  'Información de Cuidado',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Row(
                  children: const [
                    Text('¿Microchip?', style: TextStyle(color: blackColor80)),
                    Expanded(child: SizedBox()),
                    PetButtonSelectable(
                      isSelected: false,
                      iconData: Icons.check,
                      petButtonText: 'Yes',
                    ),
                    SizedBox(width: 8),
                    PetButtonSelectable(
                      isSelected: false,
                      iconData: Icons.close,
                      petButtonText: 'No',
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: const [
                    Text('¿Vacunado?', style: TextStyle(color: blackColor80)),
                    Expanded(child: SizedBox()),
                    PetButtonSelectable(
                      isSelected: false,
                      iconData: Icons.check,
                      petButtonText: 'Yes',
                    ),
                    SizedBox(width: 8),
                    PetButtonSelectable(
                      isSelected: false,
                      iconData: Icons.close,
                      petButtonText: 'No',
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: const [
                    Text('¿Castrado?', style: TextStyle(color: blackColor80)),
                    Expanded(child: SizedBox()),
                    PetButtonSelectable(
                      isSelected: false,
                      iconData: Icons.check,
                      petButtonText: 'Yes',
                    ),
                    SizedBox(width: 8),
                    PetButtonSelectable(
                      isSelected: false,
                      iconData: Icons.close,
                      petButtonText: 'No',
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: const [
                    Text('¿Medicado?', style: TextStyle(color: blackColor80)),
                    Expanded(child: SizedBox()),
                    PetButtonSelectable(
                      isSelected: false,
                      iconData: Icons.check,
                      petButtonText: 'Yes',
                    ),
                    SizedBox(width: 8),
                    PetButtonSelectable(
                      isSelected: false,
                      iconData: Icons.close,
                      petButtonText: 'No',
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                    'Ahora ingresa que medicamentos esta tomando tu fiel amigo:',
                    style: TextStyle(color: blackColor80)),
                const SizedBox(height: 8),
                PetInputField(
                  textEditingController: medicCntrl,
                  keyboardType: TextInputType.text,
                  hintText:
                      'Meloxicam para la artritis, amoxicilina como antibiotico',
                  prefixIcon: 'assets/icons/dog.svg',
                  errorText: 'intenta ser exacto',
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding:
              const EdgeInsets.only(top: 16, bottom: 24, right: 16, left: 16),
          child: ElevatedButton(
            onPressed: () {
              //Navigator.pushNamed(context, Successfullpage.route);
              register();
            },
            child: const Text('CONTINUAR'),
          ),
        ),
      ),
    );
  }

  void register() {
    if (hasCompleteData()) {
      // usar bloc, un valueStream<bool> y un set para sobreescribir que la data esta completa
      print('complete');
    } else {
      // usar bloc, un valueStream<bool> y un set para sobreescribir que la data necesita ser completada
      // ademas podemos mostrar un widget mencionando el error de que la data necesita ser completada para continuar con los siguientes pasos
    }
  }

  bool hasCompleteData() {
    return namePetCntrl.text.isNotEmpty &&
        dateBirthCntrl.text.isNotEmpty &&
        raceCntrl.text.isNotEmpty &&
        behaviorCntrl.text.isNotEmpty;
  }

  @override
  void dispose() {
    namePetCntrl.dispose();
    dateBirthCntrl.dispose();
    raceCntrl.dispose();
    behaviorCntrl.dispose();
    medicCntrl.dispose();
    super.dispose();
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
