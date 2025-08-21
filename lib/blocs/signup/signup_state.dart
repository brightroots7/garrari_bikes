class SignupState {
  final String name;
  final String email;
  final String password;
  final String phoneNumber;
  final String confirmPassword;
  final bool isPasswordVisible;final bool isSubmitting;
  final bool isSuccess;

  SignupState({
    this.name = '',
    this.email = '',
    this.password = '',
    this.phoneNumber ='', this.isSubmitting = false,
    this.isSuccess = false,
    this.isPasswordVisible = false,
    this.confirmPassword = '',
  });

  SignupState copyWith({
    String? name,
    String? email,
    String? phoneNumber,

    bool? isSubmitting,
    bool? isSuccess,
    bool? isPasswordVisible,
    String? password,
    String? confirmPassword,
  }) {
    return SignupState(
      name: name ?? this.name,
      email: email ?? this.email,

      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
