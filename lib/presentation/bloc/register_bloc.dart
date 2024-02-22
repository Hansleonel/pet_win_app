import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import 'provider/bloc.dart';

@injectable
class RegisterBloc extends Bloc {
  final _petSelectedSubject = BehaviorSubject<int>();
  final _petHasMicrochipSubject = BehaviorSubject<int>();
  final _petHasVaccineSubject = BehaviorSubject<int>();
  final _petIsNeuteredSubject = BehaviorSubject<int>();
  final _petHasMedicationSubject = BehaviorSubject<int>();

  ValueStream<int> get petSelected => _petSelectedSubject.stream;
  ValueStream<int> get petHasMicrochip => _petHasMicrochipSubject.stream;
  ValueStream<int> get petHasVaccine => _petHasVaccineSubject.stream;
  ValueStream<int> get petIsNeutered => _petIsNeuteredSubject.stream;
  ValueStream<int> get petHasMedication => _petHasMedicationSubject.stream;

  set setPetSelected(int value) => _petSelectedSubject.value = value;
  set setPetHasMicrochip(int value) => _petHasMicrochipSubject.value = value;
  set setPetHasVaccine(int value) => _petHasVaccineSubject.value = value;
  set setPetIsNeutered(int value) => _petIsNeuteredSubject.value = value;
  set setPetHasMedication(int value) => _petHasMedicationSubject.value = value;

  @override
  void dispose() {
    _petSelectedSubject.close();
    _petHasMicrochipSubject.close();
    _petHasVaccineSubject.close();
    _petIsNeuteredSubject.close();
  }
}
