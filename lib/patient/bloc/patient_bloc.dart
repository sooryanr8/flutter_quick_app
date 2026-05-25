import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/patient_repository.dart';
import 'patient_state.dart';

class PatientBloc extends Cubit<PatientState> {
  final PatientRepository repository;

  PatientBloc(this.repository) : super(PatientLoading());

  Future<void> load({String search = ""}) async {
    try {
      final result = await repository.getPatients(search: search);

      if (result.isEmpty) {
        emit(PatientEmpty());

        return;
      }

      emit(PatientLoaded(result));
    } catch (e) {
      print(e);

      emit(PatientError());
    }
  }

  Future<void> search(String query) async {
    await load(search: query);
  }
}
