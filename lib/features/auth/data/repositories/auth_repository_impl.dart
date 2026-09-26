import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_mock_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.dataSource);

  final AuthMockDataSource dataSource;

  @override
  Future<User?> login(String email, String password) =>
      dataSource.login(email, password);
}
