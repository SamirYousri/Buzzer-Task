abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthError extends AuthState {
  final String error;

  AuthError(this.error);
}

class AuthPasswordVisibilityToggled extends AuthState {
  final bool isPasswordVisible;

  AuthPasswordVisibilityToggled(this.isPasswordVisible);
}
