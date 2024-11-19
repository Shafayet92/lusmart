// NotificationsScreen.dart

import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy data for notifications
    final List<Map<String, String>> notifications = [
      {
        'title': 'New Assignment Posted',
        'message': 'A new assignment for "Introduction to AI" has been posted.',
        'date': '2024-11-18',
      },
      {
        'title': 'Upcoming Exam Reminder',
        'message':
            'Your exam for "Data Structures & Algorithms" is on 2024-11-25.',
        'date': '2024-11-17',
      },
      {
        'title': 'Profile Updated',
        'message': 'Your profile information was successfully updated.',
        'date': '2024-11-16',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: Colors.deepPurple,
        elevation: 8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: notifications.length, // Using the dummy data
          itemBuilder: (context, index) {
            return Card(
              elevation: 6,
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(15),
                title: Text(
                  notifications[index]['title']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                subtitle: Text(
                  notifications[index]['message']!,
                  style: const TextStyle(color: Colors.black54),
                ),
                trailing: Text(
                  notifications[index]['date']!,
                  style: const TextStyle(color: Colors.black45),
                ),
                onTap: () {
                  // Add functionality for detailed notification view if needed
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => NotificationDetailScreen(notificationId: index)),
                  // );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
