import 'package:bloc/bloc.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<PasswordVisibilityToggled>((event, emit) {
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
    });

    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<LoginSubmitted>((event, emit) {
      print('Email: ${state.email}, Password: ${state.password}');
    });

    on<ForgotPasswordEmailChanged>((event, emit) {
      emit(state.copyWith(forgotPasswordEmail: event.email));
    });
    on<ConfirmPasswordChanged>((event, emit) {
      emit(state.copyWith(confirmPassword: event.confirmPassword));
    });
    on<ForgotPasswordSubmitted>((event, emit) async {
      emit(state.copyWith(
        isForgotPasswordSubmitting: true,
        isForgotPasswordSuccess: false,
      ));

      await Future.delayed(const Duration(seconds: 2));

      final success = state.forgotPasswordEmail.isNotEmpty;

      emit(state.copyWith(
        isForgotPasswordSubmitting: false,
        isForgotPasswordSuccess: success,
      ));
    });
  }
}
