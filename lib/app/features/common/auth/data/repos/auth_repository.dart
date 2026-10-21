
import 'package:doctor_hunt/app/features/common/auth/data/service/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  final AuthService authService;

  AuthRepository({AuthService? authService})
      : authService = authService ?? AuthService();

  Future<AuthResponse> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    return await authService.signUp(
      name: name,
      email: email,
      password: password,
    );
  }

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    return await authService.signIn(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await authService.signOut();
  }

  Future<void> resetPassword({
    required String email,
  }) async {
    await authService.resetPassword(email: email);
  }
  Future<String?> getCurrentUserRole() {
  return authService.getCurrentUserRole();
}
}
