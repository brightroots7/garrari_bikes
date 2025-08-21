import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.pushNamed(context,'/editProfile');
            },
            icon:  Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(Icons.edit, color: Colors.black, size: 18),
            ),
            label:Text(
              "Edit",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profile.jpg'), // Replace with your image
                backgroundColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'John Doe',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            _buildReadOnlyTextField(label: 'Name', value: 'John Doe'),
            const SizedBox(height: 16),
            _buildReadOnlyTextField(label: 'Phone Number', value: '+1 123 456 7890'),
            const SizedBox(height: 16),
            _buildReadOnlyTextField(label: 'Email', value: 'john.doe@example.com'),
          ],
        ),
      ),
    );
  }

  Widget _buildReadOnlyTextField({required String label, required String value}) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(12),
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
          labelText: label,
          hintText: value,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
