
import 'package:doctor_hunt/app/features/common/auth/data/repos/auth_repository.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/controllers/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit({AuthRepository? authRepository})
      : _authRepository = authRepository ?? AuthRepository(),
        super(const AuthInitial());

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(const SignInLoading());

    try {
      await _authRepository.signIn(
        email: email,
        password: password,
      );

      emit(const SignInSuccess());
    } catch (e) {
      emit(AuthError(_getErrorMessage(e)));
    }
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(const SignUpLoading());

    try {
      final response = await _authRepository.signUp(
        name: name,
        email: email,
        password: password,
      );

      emit(
        SignUpSuccess(
          requiresEmailConfirmation: response.session == null,
        ),
      );
    } catch (e) {
      emit(AuthError(_getErrorMessage(e)));
    }
  }

  Future<void> resetPassword({
    required String email,
  }) async {
    emit(const PasswordResetLoading());

    try {
      await _authRepository.resetPassword(email: email);
      emit(const PasswordResetSuccess());
    } catch (e) {
      emit(AuthError(_getErrorMessage(e)));
    }
  }

  Future<void> signOut() async {
    try {
      await _authRepository.signOut();
      emit(const SignOutSuccess());
    } catch (e) {
      emit(AuthError(_getErrorMessage(e)));
    }
  }

  String _getErrorMessage(Object error) {
    return error.toString().replaceFirst('Exception: ', '');
  }

Future<void> adminSignIn({
  required String email,
  required String password,
}) async {
  emit(const AdminSignInLoading());

  try {
    // 1. Authenticate with Supabase.
    await _authRepository.signIn(
      email: email,
      password: password,
    );

    // 2. Read the actual role from the database.
    final role = await _authRepository.getCurrentUserRole();

    // 3. Deny access unless the role is exactly "admin".
    if (role != 'admin') {
      await _authRepository.signOut();
      emit(const AdminAccessDenied());
      return;
    }

    // 4. Allow the screen to handle successful navigation.
    emit(const AdminSignInSuccess());
  } catch (e) {
    // If role verification fails, do not leave the session active.
    try {
      await _authRepository.signOut();
    } catch (_) {
      // Preserve the original error.
    }

    emit(AuthError(_getErrorMessage(e)));
  }
}

}
