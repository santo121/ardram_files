import 'package:ardram/Notifications/widget/notification_card.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      
        title: const Text(
          "Notifications",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                
              },
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
              ))
        ],
      ),
      body: Column(
        children: [
          notificationCard(context),
          notificationCard(context),
          notificationCard(context),
          notificationCard(context),
        ],
      ),
    );
  }
}