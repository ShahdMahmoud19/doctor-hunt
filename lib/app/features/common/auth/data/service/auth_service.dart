import 'package:doctor_hunt/app/core/network/supabase_config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient client = SupabaseConfig.client;
  Future<AuthResponse> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await client.auth.signUp(
      password: password,
      email: email.trim(),
      data: {'full_name': name},
    );
    return response;
  }

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    final response = await client.auth.signInWithPassword(
      password: password,
      email: email.trim(),
    );
    return response;
  }
  Future<void> signOut() async {
    await client.auth.signOut();
  }
  Future<void> resetPassword({required String email}) async {
    await client.auth.resetPasswordForEmail(email.trim());
  }
  Future<String?> getCurrentUserRole() async {
  final user = client.auth.currentUser;

  if (user == null) {
    return null;
  }

  final profile = await client
      .from('profiles')
      .select('role')
      .eq('id', user.id)
      .maybeSingle();

  return profile?['role'] as String?;
}
}
