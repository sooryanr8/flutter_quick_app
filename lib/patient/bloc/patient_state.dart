import '../models/patient_model.dart';

abstract class PatientState {}

class PatientLoading extends PatientState {}

class PatientLoaded extends PatientState {
  final List<PatientModel> patients;

  PatientLoaded(this.patients);
}

class PatientEmpty extends PatientState {}

class PatientError extends PatientState {}
