import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Dashboard',
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
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildDashboardCard(
              icon: Icons.face,
              title: "Submit Facial Data",
              color: Colors.deepOrange,
              onTap: () {
                // Navigate to Submit Facial Data Screen
              },
            ),
            _buildDashboardCard(
              icon: Icons.book,
              title: "Enrolled Courses",
              color: Colors.teal,
              onTap: () {
                // Navigate to Enrolled Courses Screen
              },
            ),
            _buildDashboardCard(
              icon: Icons.check_circle,
              title: "Attendance Status",
              color: Colors.blueAccent,
              onTap: () {
                // Navigate to Attendance Status Screen
              },
            ),
            _buildDashboardCard(
              icon: Icons.notifications,
              title: "Notifications",
              color: Colors.purple,
              onTap: () {
                // Navigate to Notifications Screen
              },
            ),
            _buildDashboardCard(
              icon: Icons.settings,
              title: "Settings",
              color: Colors.green,
              onTap: () {
                // Navigate to Settings/Profile Management Screen
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.8),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 8,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48,
              color: Colors.white,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
