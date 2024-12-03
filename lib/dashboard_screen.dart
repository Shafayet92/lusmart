import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart'; // Import the login screen

// import 'submit_facial_data_screen.dart'; // Import SubmitFacialDataScreen
import 'EnrolledCoursesScreen.dart'; // Import EnrolledCoursesScreen
import 'AttendanceStatusScreen.dart'; // Import AttendanceStatusScreen
import 'NotificationsScreen.dart'; // Import NotificationsScreen
import 'SettingsScreen.dart'; // Import SettingsScreen

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0; // Variable to track the selected index

  // List of screens for each navigation item
  final List<Widget> _screens = [
    const Center(
        child: Text(
            'Submit Facial Data')), // Placeholder screen for Submit Facial Data
    const EnrolledCoursesScreen(),
    const AttendanceStatusScreen(),
    const NotificationsScreen(),
    const SettingsScreen(),
  ];

  // Method to handle navigation item tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update selected index
    });
  }

  Future<void> _logout() async {
    try {
      await FirebaseAuth.instance.signOut(); // Sign the user out
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const LoginScreen()), // Redirect to LoginScreen
      );
    } catch (e) {
      // Handle errors if necessary (e.g., show a snackbar or dialog)
      print('Error logging out: $e');
    }
  }

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
        actions: [
          // Logout button in the app bar
          IconButton(
            icon: const Icon(Icons.exit_to_app, color: Colors.white),
            onPressed: _logout,
          ),
        ],
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const SubmitFacialDataScreen(),
                    //   ),
                    // );
                  },
                ),
                _buildDashboardCard(
                  icon: Icons.book,
                  title: "Enrolled Courses",
                  color: Colors.teal,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EnrolledCoursesScreen(),
                      ),
                    );
                  },
                ),
                _buildDashboardCard(
                  icon: Icons.check_circle,
                  title: "Attendance Status",
                  color: Colors.blueAccent,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AttendanceStatusScreen(),
                      ),
                    );
                  },
                ),
                _buildDashboardCard(
                  icon: Icons.notifications,
                  title: "Notifications",
                  color: Colors.purple,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationsScreen(),
                      ),
                    );
                  },
                ),
                _buildDashboardCard(
                  icon: Icons.settings,
                  title: "Settings",
                  color: Colors.green,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsScreen(),
                      ),
                    );
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
      // Bottom Navigation Bar added
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Track the selected tab
        onTap: _onItemTapped, // Handle tab selection
        backgroundColor:
            Colors.deepPurple, // Custom background color for bottom bar
        selectedItemColor:
            const Color.fromARGB(255, 68, 54, 54), // Selected icon color
        unselectedItemColor: Colors.grey, // Unselected icon color
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: 'Facial Data',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Attendance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
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
