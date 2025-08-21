class AccountState {
  final bool isNotificationEnabled;
  final String name;
  final String phone;
  final String email;

  AccountState({
    required this.isNotificationEnabled,
    required this.name,
    required this.phone,
    required this.email,
  });

  AccountState copyWith({
    bool? isNotificationEnabled,
    String? name,
    String? phone,
    String? email,
  }) {
    return AccountState(
      isNotificationEnabled: isNotificationEnabled ?? this.isNotificationEnabled,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
    );
  }
}
