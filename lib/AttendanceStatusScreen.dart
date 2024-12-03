// AttendanceStatusScreen.dart

import 'package:flutter/material.dart';

class AttendanceStatusScreen extends StatelessWidget {
  const AttendanceStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for attendance status
    final List<Map<String, String>> attendanceData = [
      {
        'course_name': 'Introduction to AI',
        'attendance': '80%',
      },
      {
        'course_name': 'Flutter Development',
        'attendance': '95%',
      },
      {
        'course_name': 'Data Structures & Algorithms',
        'attendance': '90%',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Attendance Status',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: attendanceData.length, // Using the dummy data
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
                  attendanceData[index]['course_name']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                subtitle: Text(
                  'Attendance: ${attendanceData[index]['attendance']}',
                  style: const TextStyle(color: Colors.black54),
                ),
                trailing: const Icon(Icons.check_circle_outline),
                onTap: () {
                  // Add functionality for detailed attendance if needed
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => AttendanceDetailsScreen(courseId: index)),
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
