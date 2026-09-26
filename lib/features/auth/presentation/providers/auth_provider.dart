import 'package:flutter/foundation.dart';

import '../../data/datasources/auth_mock_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/login.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider() : _login = Login(AuthRepositoryImpl(AuthMockDataSource()));

  final Login _login;
  User? _user;
  bool _isLoading = false;

  User? get user => _user;
  bool get isLoading => _isLoading;

  Future<void> signIn(String email, String password) async {
    _isLoading = true;
    notifyListeners();
    _user = await _login(email, password);
    _isLoading = false;
    notifyListeners();
  }

  void signOut() {
    _user = null;
    notifyListeners();
  }
}
