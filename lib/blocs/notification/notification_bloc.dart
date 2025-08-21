import 'package:flutter_bloc/flutter_bloc.dart';
import 'notificationModel.dart';
import 'notification_event.dart';
import 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationState()) {
    on<LoadNotifications>(_onLoadNotifications);
    on<ClearNotifications>((event, emit) {
      emit(state.copyWith(notifications: []));
    });
  }

  void _onLoadNotifications(LoadNotifications event, Emitter<NotificationState> emit) async {
    await Future.delayed(Duration(milliseconds: 500)); // simulate delay
    final notifications = [
      NotificationItem(
        title: "Your order #2323 has been shipped.",
        time: "Yesterday at 4:15pm",
        type: "order",
      ),
      NotificationItem(
        title: "Flat 20% OFF on all mountain bikes!",
        time: "2 days ago",
        type: "sale",
      ),
      NotificationItem(
        title: "Order #1227 delivered successfully.",
        subtitle: "We hope you enjoy the ride!",
        time: "5 days ago",
        type: "order",
      ),
    ];
    emit(state.copyWith(notifications: notifications));
  }
}
