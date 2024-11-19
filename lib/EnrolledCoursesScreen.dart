// EnrolledCoursesScreen.dart

import 'package:flutter/material.dart';

class EnrolledCoursesScreen extends StatelessWidget {
  const EnrolledCoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy course data
    final List<Map<String, String>> courses = [
      {
        'course_name': 'Introduction to AI',
        'status': 'Active',
      },
      {
        'course_name': 'Flutter Development',
        'status': 'Completed',
      },
      {
        'course_name': 'Data Structures & Algorithms',
        'status': 'Active',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Enrolled Courses"),
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
          itemCount: courses.length, // Using the dummy courses list
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
                  courses[index]['course_name']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                subtitle: Text(
                  'Status: ${courses[index]['status']}',
                  style: const TextStyle(color: Colors.black54),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Add navigation to course details screen if needed
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => CourseDetailsScreen(courseId: index)),
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
