import 'package:flutter/material.dart';
import 'submit_facial_data_screen.dart'; // Import SubmitFacialDataScreen

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
        child: Stack(
          children: [
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.2, // Adjusted for better visual balance
              children: [
                _buildDashboardCard(
                  icon: Icons.face,
                  title: "Submit Facial Data",
                  color: Colors.deepOrange,
                  onTap: () {
                    // Navigate to Submit Facial Data Screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SubmitFacialDataScreen(),
                      ),
                    );
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
            Positioned(
              top: 16,
              right: 16,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    'https://www.example.com/user-profile-image.jpg'), // Replace with your image URL or Asset
                backgroundColor: Colors.transparent,
              ),
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
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.8),
              color.withOpacity(0.6),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(4, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 56,
              color: Colors.white,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
