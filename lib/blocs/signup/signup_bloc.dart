import 'signup_event.dart';
import 'signup_state.dart';
import 'package:bloc/bloc.dart';

class SignupBloc extends Bloc<SignupEvent,SignupState>{
  SignupBloc() : super(SignupState()) {
    on<PasswordVisibilityToggled>((event, emit) {
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
    });
    on<NameChanged>((event, emit) => emit(state.copyWith(name: event.name)));
    on<EmailChanged>((event, emit) => emit(state.copyWith(email: event.email)));
    on<PhoneNumberChanged>((event,emit) => emit(state.copyWith(phoneNumber: event.phoneNumber)));
    on<PasswordChanged>((event, emit) => emit(state.copyWith(password: event.password)));
    on<ConfirmPasswordChanged>((event, emit) => emit(state.copyWith(confirmPassword: event.confirmPassword)));
    on<SubmitSignup>((event, emit) {
      // handle form submission, validation, API call, etc.
    });
  }
  }