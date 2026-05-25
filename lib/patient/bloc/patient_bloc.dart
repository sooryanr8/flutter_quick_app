import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/logger/logger_helper.dart';
import '../repository/patient_repository.dart';
import 'patient_state.dart';

class PatientBloc extends Cubit<PatientState> {
  final PatientRepository repository;

  PatientBloc(this.repository) : super(PatientInitial());

  Future<void> search(String query) async {
    try {
      logInfo('Patient search → $query');

      if (query.trim().isEmpty) {
        emit(PatientInitial());

        return;
      }

      final result = await repository.getPatients(search: query);

      if (result.isEmpty) {
        emit(PatientEmpty());

        return;
      }

      emit(PatientLoaded(result));
    } catch (e, s) {
      logError('Patient search failed', error: e, stackTrace: s);

      emit(PatientError());
    }
  }
}
