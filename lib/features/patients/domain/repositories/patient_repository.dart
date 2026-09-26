import '../entities/patient.dart';

abstract interface class PatientRepository {
  List<Patient> getPatients();
}
