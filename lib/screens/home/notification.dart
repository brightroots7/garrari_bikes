import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garraribikes/constants/Appcolors.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../blocs/notification/notificationModel.dart';
import '../../blocs/notification/notification_bloc.dart';
import '../../blocs/notification/notification_event.dart';
import '../../blocs/notification/notification_state.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NotificationBloc()..add(LoadNotifications()),
      child: Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.white,
          title: Text(
            "Notifications",
            style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: () => context.read<NotificationBloc>().add(ClearNotifications()),
              child: Text("Clear", style: GoogleFonts.poppins(color: Colors.red)),
            ),
          ],
        ),
        body: BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, state) {
            if (state.notifications.isEmpty) {
              return Center(child: Text("No notifications"));
            }
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.notifications.length,
              itemBuilder: (context, index) {
                final item = state.notifications[index];
                return _buildNotificationItem(item);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildNotificationItem(NotificationItem item) {
    final icon = item.type == 'order'
        ? 'assets/images/delivery_truck.png'
        : 'assets/images/discount.png';

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [BoxShadow(blurRadius: 4, color: Colors.black12)],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(icon, width: 35, height: 35),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    )),
                if (item.subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(item.subtitle!,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600],
                      )),
                ],
                const SizedBox(height: 8),
                Text(item.time,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Appcolors.yellow2,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
