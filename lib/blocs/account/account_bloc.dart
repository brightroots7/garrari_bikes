import 'package:flutter_bloc/flutter_bloc.dart';
import 'account_event.dart';
import 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc()
      : super(AccountState(
    isNotificationEnabled: false,
    name: 'John Doe',
    phone: '+1 123 456 7890',
    email: 'john.doe@example.com',
  )) {
    on<ToggleNotification>((event, emit) {
      emit(state.copyWith(isNotificationEnabled: event.isEnabled));
    });

    on<UpdateProfile>((event, emit) {
      emit(state.copyWith(
        name: event.name,
        phone: event.phone,
        email: event.email,
      ));
    });
  }
}
