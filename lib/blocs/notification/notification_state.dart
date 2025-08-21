

import 'notificationModel.dart';

class NotificationState {
  final List<NotificationItem> notifications;

  NotificationState({this.notifications = const []});

  NotificationState copyWith({List<NotificationItem>? notifications}) {
    return NotificationState(
      notifications: notifications ?? this.notifications,
    );
  }
}
