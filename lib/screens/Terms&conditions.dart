import 'package:flutter/material.dart';
import 'package:garraribikes/constants/Appcolors.dart';

class Termsandconditions extends StatelessWidget {
  const Termsandconditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.grey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Header with back button
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Terms & Conditions',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // for symmetry with back button
                ],
              ),
              const SizedBox(height: 16),

              // Scrollable content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Thank you for visiting www.garraribikes.com.',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'We respect your privacy and consider it a pertinent element of our business. This privacy policy statement applies to www.garraribikes.com only. It does not apply to information collected and stored by means other than the website.',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Privacy Of Personal Information',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'With due respect to the privacy of its users, the Garrari Bikes website abstains from getting personal information from users without their denotative consent.',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Garrari Bikes does not distribute, sell or rent any personal information collected via its website. This is also true for personal information (email address, postal address, etc.) sent to the website\'s email addresses and contact notes.',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Garrari Bikes does not send unsolicited emails to users of its site and the personal information entered via the site\'s registration forms such as feedback form, complaint form, etc., are protected by security features.',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
