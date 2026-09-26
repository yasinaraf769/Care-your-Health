import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class Login {
  Login(this.repository);

  final AuthRepository repository;

  Future<User?> call(String email, String password) =>
      repository.login(email, password);
}
