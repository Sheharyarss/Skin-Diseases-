import '../models/user_model.dart';

class AuthService {
  // Mock user data
  UserModel? _loggedInUser;

  Future<UserModel?> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2)); // Mock delay
    if (email == 'test@example.com' && password == 'password123') {
      _loggedInUser = UserModel(
        id: '1',
        name: 'John Doe',
        email: email,
        gender: 'Male',
        skinType: 'Type III',
      );
      return _loggedInUser;
    }
    return null; // Login failed
  }

  Future<bool> signUp(String name, String email, String password) async {
    await Future.delayed(const Duration(seconds: 2)); // Mock delay
    // Mock sign-up logic
    return true;
  }

  UserModel? get loggedInUser => _loggedInUser;
}
