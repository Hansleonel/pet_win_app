import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_app_win/config/theme/constants/constants.dart';
import 'package:pet_app_win/presentation/widgets/pet_input_field.dart';
import 'package:pet_app_win/presentation/widgets/shared/pet_divider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../data/dependency_injection/injection.dart';
import '../../bloc/pet_register_bloc.dart';
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
  final PetRegisterBloc? petRegisterBloc =
      Provider.of<PetRegisterBloc>(() => getIt.get<PetRegisterBloc>());
  final ScrollController scrollController = ScrollController();
  final FocusNode medicFocusNode = FocusNode();
  final List<String> list = <String>['Masculino', 'Femenino', 'No definido'];
  TextEditingController namePetCntrl = TextEditingController();
  TextEditingController dateBirthCntrl = TextEditingController();
  TextEditingController raceCntrl = TextEditingController();
  TextEditingController weightCntrl = TextEditingController();
  TextEditingController behaviorCntrl = TextEditingController();
  TextEditingController careCntrl = TextEditingController();
  TextEditingController sexCntrl = TextEditingController();
  TextEditingController medicCntrl = TextEditingController();

  void moveScrollToBottom() {
    scrollController.animateTo(
      scrollController.position.pixels + 120,
      duration: const Duration(milliseconds: 150),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final lang = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const AppBarStepper(
            orderActivate: 1,
          ),
        ),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    lang.pet_registration_tell_us_about_your_pet,
                    style: titleStyle,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(lang.pet_registration_help_us_get_to_know_your_pet,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: blackColor60,
                    )),
                const SizedBox(height: 16.0),
                Text(
                  '¿Qué tipo de mascota tienes?',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8.0),
                StreamBuilder<int>(
                  stream: petRegisterBloc!.petSelected,
                  initialData: 0,
                  builder: (context, snapshot) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ItemPetRegistration(
                          idPet: 1,
                          title: lang.pet_registration_puppy,
                          icon: 'dog',
                          bloc: petRegisterBloc!,
                          isSelectedItem: (snapshot.data == 1),
                        ),
                        ItemPetRegistration(
                          idPet: 2,
                          title: lang.pet_registration_kitten,
                          icon: 'cat',
                          bloc: petRegisterBloc!,
                          isSelectedItem: (snapshot.data == 2),
                        ),
                        ItemPetRegistration(
                          idPet: 3,
                          title: lang.pet_registration_other,
                          icon: 'bird',
                          bloc: petRegisterBloc!,
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
                  lang.pet_registration_about_your_pet,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                const PetAvatar(),
                const SizedBox(height: 16),
                Text(
                  lang.pet_registration_buddy_name,
                  style: const TextStyle(color: blackColor80),
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
                const Text(
                  'Su sexo',
                  style: TextStyle(color: blackColor80),
                ),
                const SizedBox(height: 4),
                FocusScope(
                  canRequestFocus: false,
                  child: DropdownMenu(
                    leadingIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: defaultPadding * 0.75),
                      child: SvgPicture.asset('assets/icons/FaceId.svg',
                          height: 24,
                          width: 24,
                          color: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .color!
                              .withOpacity(0.3)),
                    ),
                    controller: sexCntrl,
                    width: MediaQuery.of(context).size.width - 32,
                    enableSearch: false,
                    hintText: 'Sexo',
                    dropdownMenuEntries:
                        list.map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(
                          value: value, label: value);
                    }).toList(),
                  ),
                ),
                const PetDivider(height: 24),
                Text(
                  'Información de Cuidado',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                StreamBuilder<int>(
                  stream: petRegisterBloc!.petHasMicrochip,
                  initialData: 0,
                  builder: (context, snapshot) {
                    return Row(
                      children: [
                        const Text('¿Microchip?',
                            style: TextStyle(color: blackColor80)),
                        const Expanded(child: SizedBox()),
                        PetButtonSelectable(
                          isSelected: snapshot.data == 1,
                          iconData: Icons.check,
                          petButtonText: 'Yes',
                          onTap: () {
                            petRegisterBloc!.setPetHasMicrochip = 1;
                          },
                        ),
                        const SizedBox(width: 8),
                        PetButtonSelectable(
                          isSelected: snapshot.data == 2,
                          iconData: Icons.close,
                          petButtonText: 'No',
                          onTap: () {
                            petRegisterBloc!.setPetHasMicrochip = 2;
                          },
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 16),
                StreamBuilder<int>(
                  stream: petRegisterBloc!.petHasVaccine,
                  initialData: 0,
                  builder: (context, snapshot) {
                    return Row(
                      children: [
                        const Text('¿Vacunado?',
                            style: TextStyle(color: blackColor80)),
                        const Expanded(child: SizedBox()),
                        PetButtonSelectable(
                          isSelected: snapshot.data == 1,
                          iconData: Icons.check,
                          petButtonText: 'Yes',
                          onTap: () {
                            petRegisterBloc!.setPetHasVaccine = 1;
                          },
                        ),
                        const SizedBox(width: 8),
                        PetButtonSelectable(
                          isSelected: snapshot.data == 2,
                          iconData: Icons.close,
                          petButtonText: 'No',
                          onTap: () {
                            petRegisterBloc!.setPetHasVaccine = 2;
                          },
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 16),
                StreamBuilder<int>(
                  stream: petRegisterBloc!.petIsNeutered,
                  initialData: 0,
                  builder: (context, snapshot) {
                    return Row(
                      children: [
                        const Text('¿Castrado?',
                            style: TextStyle(color: blackColor80)),
                        const Expanded(child: SizedBox()),
                        PetButtonSelectable(
                          isSelected: snapshot.data == 1,
                          iconData: Icons.check,
                          petButtonText: 'Yes',
                          onTap: () {
                            petRegisterBloc!.setPetIsNeutered = 1;
                          },
                        ),
                        const SizedBox(width: 8),
                        PetButtonSelectable(
                          isSelected: snapshot.data == 2,
                          iconData: Icons.close,
                          petButtonText: 'No',
                          onTap: () {
                            petRegisterBloc!.setPetIsNeutered = 2;
                          },
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 16),
                StreamBuilder<int>(
                  stream: petRegisterBloc!.petHasMedication,
                  initialData: 0,
                  builder: (context, snapshot) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            const Text('¿Medicado?',
                                style: TextStyle(color: blackColor80)),
                            const Expanded(child: SizedBox()),
                            PetButtonSelectable(
                                isSelected: snapshot.data == 1,
                                iconData: Icons.check,
                                petButtonText: 'Yes',
                                onTap: () {
                                  petRegisterBloc!.setPetHasMedication = 1;
                                  moveScrollToBottom();
                                  Future.delayed(
                                    const Duration(milliseconds: 200),
                                    () {
                                      FocusScope.of(context)
                                          .requestFocus(medicFocusNode);
                                    },
                                  );
                                }),
                            const SizedBox(width: 8),
                            PetButtonSelectable(
                              isSelected: snapshot.data == 2,
                              iconData: Icons.close,
                              petButtonText: 'No',
                              onTap: () {
                                petRegisterBloc!.setPetHasMedication = 2;
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        snapshot.data == 1
                            ? Column(
                                children: [
                                  const Text(
                                      'Ahora ingresa que medicamentos esta tomando tu fiel amigo y sus posibles dolencias:',
                                      style: TextStyle(color: blackColor80)),
                                  const SizedBox(height: 8),
                                  PetInputField(
                                    enabled: true,
                                    focusNode: medicFocusNode,
                                    textEditingController: medicCntrl,
                                    keyboardType: TextInputType.text,
                                    hintText:
                                        'Meloxicam para la artritis, amoxicilina como antibiotico',
                                    prefixIcon: 'assets/icons/dog.svg',
                                    errorText: 'intenta ser exacto',
                                  ),
                                ],
                              )
                            : const SizedBox(),
                      ],
                    );
                  },
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
            child: const Text(
              'CONTINUAR',
              style: TextStyle(color: whiteColor),
            ),
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
      print('no complete');
      // usar bloc, un valueStream<bool> y un set para sobreescribir que la data necesita ser completada
      // ademas podemos mostrar un widget mencionando el error de que la data necesita ser completada para continuar con los siguientes pasos
    }
  }

  bool hasCompleteData() {
    return namePetCntrl.text.isNotEmpty &&
        dateBirthCntrl.text.isNotEmpty &&
        raceCntrl.text.isNotEmpty &&
        weightCntrl.text.isNotEmpty &&
        behaviorCntrl.text.isNotEmpty &&
        sexCntrl.text.isNotEmpty &&
        petRegisterBloc!.petSelected.hasValue &&
        petRegisterBloc!.petHasMicrochip.hasValue &&
        petRegisterBloc!.petHasVaccine.hasValue &&
        petRegisterBloc!.petIsNeutered.hasValue &&
        hasOptionSelectedMedication() &&
        (petRegisterBloc!.petHasMedication.value == 1
            ? medicCntrl.text.isNotEmpty
            : true);
  }

  bool hasOptionSelectedMedication() {
    return petRegisterBloc!.petHasMedication.hasValue;
  }

  @override
  void dispose() {
    namePetCntrl.dispose();
    dateBirthCntrl.dispose();
    raceCntrl.dispose();
    behaviorCntrl.dispose();
    //sexCntrl.dispose();
    medicCntrl.dispose();
    scrollController.dispose();
    medicFocusNode.dispose();
    super.dispose();
  }
}

class ItemPetRegistration extends StatelessWidget {
  final int idPet;
  final String title;
  final String icon;
  final PetRegisterBloc bloc;
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
