import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../provider/bloc.dart';

@injectable
class OnboardingBloc extends Bloc {
  final _petSelectedSubject = BehaviorSubject<int>();

  ValueStream<int> get petSelected => _petSelectedSubject.stream;

  set setPetSelected(int value) => _petSelectedSubject.value = value;

  @override
  void dispose() {
    _petSelectedSubject.close();
  }
}
