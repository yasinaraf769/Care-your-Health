import '../entities/patient.dart';
import '../repositories/patient_repository.dart';

class GetPatients {
  GetPatients(this.repository);
  final PatientRepository repository;
  List<Patient> call() => repository.getPatients();
}
