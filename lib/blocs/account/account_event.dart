abstract class AccountEvent {}

class ToggleNotification extends AccountEvent {
  final bool isEnabled;

  ToggleNotification(this.isEnabled);
}
class UpdateProfile extends AccountEvent {
  final String name;
  final String phone;
  final String email;

  UpdateProfile({required this.name, required this.phone, required this.email});
}