import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/patient_repository.dart';
import 'patient_state.dart';

class PatientBloc extends Cubit<PatientState> {
  final PatientRepository repository;

  PatientBloc(this.repository) : super(PatientLoading());

  Future<void> load({String search = ""}) async {
    emit(PatientLoading());

    try {
      final result = await repository.getPatients(search: search);

      emit(PatientLoaded(result));
    } catch (_) {
      emit(PatientError());
    }
  }
}
