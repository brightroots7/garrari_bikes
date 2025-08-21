class NotificationItem {
  final String title;
  final String? subtitle;
  final String time;
  final String type; // 'order' or 'sale'

  NotificationItem({
    required this.title,
    this.subtitle,
    required this.time,
    required this.type,
  });
}
