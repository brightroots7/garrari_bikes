import 'package:flutter/material.dart';
import 'package:garraribikes/constants/Appcolors.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _notificationsEnabled = true;

  void _navigateTo(String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.grey,
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Custom "AppBar" inside body
          const SizedBox(height: 40),
          const Text(
            "Settings",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),

          // Profile Image
          Center(
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/profile_placeholder.png'), // Replace with your image
                  backgroundColor: Colors.grey,
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Settings List
          _buildSettingsItem(
            title: 'Edit Profile',
            onTap: () => _navigateTo('/editProfile'),
          ),
          const Divider(),
          _buildSettingsItem(
            title: 'Contact Us',
            onTap: () => _navigateTo('/contactUs'),
          ),
          const Divider(),
          _buildSettingsItem(
            title: 'Privacy Policy',
            onTap: () => _navigateTo('/privacyPolicy'),
          ),
          const Divider(),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Notifications'),
            value: _notificationsEnabled,
            activeColor: Colors.black,
            onChanged: (value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
          ),
          const Divider(),
          _buildSettingsItem(
            title: 'Terms and Conditions',
            onTap: () => _navigateTo('/terms'),
          ),
          const Divider(),
          _buildSettingsItem(
            title: 'Add Billing Address',
            onTap: () => _navigateTo('/billing'),
          ),
          const Divider(),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: () {
              // Handle logout logic
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: const Text("Logout", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem({required String title, required VoidCallback onTap}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title,),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16),
      onTap: onTap,
    );
  }
}
