abstract class ContactUsState {}

class ContactUsInitial extends ContactUsState {}

class ContactUsSubmitting extends ContactUsState {}

class ContactUsSubmitted extends ContactUsState {}

class ContactUsError extends ContactUsState {
  final String message;
  ContactUsError(this.message);
}
