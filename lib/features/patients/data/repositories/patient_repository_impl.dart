import '../../domain/entities/patient.dart';
import '../../domain/repositories/patient_repository.dart';
import '../datasources/patient_mock_data_source.dart';

class PatientRepositoryImpl implements PatientRepository {
  PatientRepositoryImpl(this.dataSource);
  final PatientMockDataSource dataSource;
  @override
  List<Patient> getPatients() => dataSource.getPatients();
}
