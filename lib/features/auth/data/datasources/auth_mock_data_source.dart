import '../models/user_model.dart';

class AuthMockDataSource {
  Future<UserModel?> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) return null;
    return const UserModel(
      id: 'user-1',
      name: 'Demo Admin',
      email: 'admin@hospital.test',
    );
  }
}
