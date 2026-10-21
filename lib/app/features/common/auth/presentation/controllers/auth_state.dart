abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class SignInLoading extends AuthState {
  const SignInLoading();
}

class SignInSuccess extends AuthState {
  const SignInSuccess();
}

class SignUpLoading extends AuthState {
  const SignUpLoading();
}

class SignUpSuccess extends AuthState {
  final bool requiresEmailConfirmation;

  const SignUpSuccess({
    required this.requiresEmailConfirmation,
  });
}

class PasswordResetLoading extends AuthState {
  const PasswordResetLoading();
}

class PasswordResetSuccess extends AuthState {
  const PasswordResetSuccess();
}

class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);
}

class SignOutSuccess extends AuthState {
  const SignOutSuccess();
}
class AdminSignInLoading extends AuthState {
  const AdminSignInLoading();
}

class AdminSignInSuccess extends AuthState {
  const AdminSignInSuccess();
}

class AdminAccessDenied extends AuthState {
  const AdminAccessDenied();
}