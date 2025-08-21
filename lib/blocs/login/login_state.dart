class LoginState {
  final String email;
  final String password;
  final bool isPasswordVisible;
  final String forgotPasswordEmail;
  final bool isForgotPasswordSubmitting;
  final bool isForgotPasswordSuccess;
  final String confirmPassword;


  LoginState({
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.isPasswordVisible = false,
    this.forgotPasswordEmail = '',
    this.isForgotPasswordSubmitting = false,
    this.isForgotPasswordSuccess = false,
  });

  LoginState copyWith({
    String? email,
    String? password,
    String? confirmPassword,
    bool? isPasswordVisible,
    String? forgotPasswordEmail,
    bool? isForgotPasswordSubmitting,
    bool? isForgotPasswordSuccess,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      forgotPasswordEmail: forgotPasswordEmail ?? this.forgotPasswordEmail,
      isForgotPasswordSubmitting: isForgotPasswordSubmitting ?? this.isForgotPasswordSubmitting,
      isForgotPasswordSuccess: isForgotPasswordSuccess ?? this.isForgotPasswordSuccess,

    );
  }
}
