import 'package:flutter_bloc/flutter_bloc.dart';

import 'contactus_event.dart';
import 'contactus_state.dart';

class ContactUsBloc extends Bloc<ContactUsEvent, ContactUsState> {
  ContactUsBloc() : super(ContactUsInitial()) {
    on<SubmitContactForm>((event, emit) async {
      emit(ContactUsSubmitting());

      try {
        await Future.delayed(const Duration(seconds: 2)); // Simulate API call
        emit(ContactUsSubmitted());
      } catch (e) {
        emit(ContactUsError("Submission failed. Please try again."));
      }
    });
  }
}
