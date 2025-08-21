abstract class LoginEvent {}

class EmailChanged extends LoginEvent {
  final String email;
  EmailChanged(this.email);
}

class PasswordChanged extends LoginEvent {
  final String password;
  PasswordChanged(this.password);
}

class LoginSubmitted extends LoginEvent {}

class PasswordVisibilityToggled extends LoginEvent {}

class ConfirmPasswordChanged extends LoginEvent {
  final String confirmPassword;
  ConfirmPasswordChanged(this.confirmPassword);
}

class ForgotPasswordEmailChanged extends LoginEvent {
  final String email;
  ForgotPasswordEmailChanged(this.email);
}

class ForgotPasswordSubmitted extends LoginEvent {}