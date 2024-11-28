import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/auth_service.dart';
import '../models/user_model.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthService());

final authProvider = StateNotifierProvider<AuthNotifier, UserModel?>((ref) {
  return AuthNotifier(ref.watch(authServiceProvider));
});

class AuthNotifier extends StateNotifier<UserModel?> {
  final AuthService _authService;

  AuthNotifier(this._authService) : super(null);

  Future<void> login(String email, String password) async {
    state = await _authService.login(email, password);
  }

  Future<bool> signUp(String name, String email, String password) async {
    return await _authService.signUp(name, email, password);
  }

  void logout() {
    state = null;
  }
}
