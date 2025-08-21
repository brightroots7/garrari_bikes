import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garraribikes/blocs/signup/signup_bloc.dart';
import 'package:garraribikes/blocs/signup/signup_event.dart';
import 'package:garraribikes/blocs/signup/signup_state.dart';
import 'package:garraribikes/constants/Appcolors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/customButton.dart';
import 'loginPage.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocProvider(
          create: (context) => SignupBloc(),
          child: BlocBuilder<SignupBloc, SignupState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: height * 0.01),
                        Text(
                          "Create account",
                          style: GoogleFonts.poppins(
                            fontSize: 32,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Sign up to get started!",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: height * 0.03),
                        Text(
                          "Name",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: height * 0.008),
                        TextField(style: GoogleFonts.poppins(color: Colors.black),
                          onChanged: (value) => context.read<SignupBloc>().add(
                            NameChanged(value),
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.008),
                        Text(
                          "Email",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: height * 0.008),
                        TextField(style: GoogleFonts.poppins(color: Colors.black),
                          onChanged: (value) => context.read<SignupBloc>().add(
                            EmailChanged(value),
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.008),
                        Text(
                          "Phone number",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: height * 0.008),
                        TextField(style: GoogleFonts.poppins(color: Colors.black),
                          onChanged: (value) {
                            context.read<SignupBloc>().add(
                              PhoneNumberChanged(value),
                            );
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),

                        SizedBox(height: height * 0.03),

                        CustomButton(
                          text: 'Next',
                          fontSize: 16,
                          textColor: Colors.black,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BlocProvider.value(
                                  value: context.read<SignupBloc>(),
                                  child: const Signuppage2(),
                                ),
                              ),
                            );
                          },
                          backgroundColor: Appcolors.yellow,
                          borderRadius: 10,
                          width: width,
                          fontWeight: FontWeight.w500,
                        ),

                        const SizedBox(height: 15),

                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Appcolors.grey.withOpacity(0.5),
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                              ),
                              child: Text(
                                "or",
                                style: TextStyle(
                                  color: Appcolors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: Appcolors.grey.withOpacity(0.5),
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.03),
                        Container(
decoration: BoxDecoration(
  color: Colors.black,borderRadius: BorderRadius.circular(10),
),
                          height: 50,
                          child: OutlinedButton.icon(
                            icon: Icon(
                              Icons.apple,
                              size: 24,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Sign up with Apple",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Appcolors.grey),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              // Handle Apple login
                            },
                          ),
                        ),
                        SizedBox(height: height * 0.015),
                        // Google login button
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 50,
                          child: OutlinedButton.icon(
                            icon: Image.asset(
                              'assets/images/Google.png',
                              width: 24,
                              height: 24,
                            ),
                            label: Text(
                              "Sign up with Google",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Appcolors.grey),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              // Handle Google login
                            },
                          ),
                        ),
                        SizedBox(height: height * 0.08),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: Text(
                                "Login",
                                style: GoogleFonts.poppins(
                                  color: Appcolors.yellow,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600, // Made it bolder
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}



class Signuppage2 extends StatelessWidget {
  const Signuppage2({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<SignupBloc, SignupState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.14),
                  Center(
                    child: Image.asset(
                      "assets/images/securePassword.png",
                      height: height * 0.15,
                    ),
                  ),
                  SizedBox(height: height * 0.06),
                  Center(
                    child: Text(
                      "Secure Your Account",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.015),
                  Center(
                    child: Text(
                      "Create a strong password to protect your \nGarrari Bikes account.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Appcolors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.05),

                  // Password field
                  Text(
                    "Password",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    style: GoogleFonts.poppins(color: Colors.black),
                    obscureText: !state.isPasswordVisible,
                    onChanged: (value) =>
                        context.read<SignupBloc>().add(PasswordChanged(value)),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          state.isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Appcolors.grey,
                        ),
                        onPressed: () {
                          context
                              .read<SignupBloc>()
                              .add(PasswordVisibilityToggled());
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Confirm password field
                  Text(
                    "Confirm Password",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    style: GoogleFonts.poppins(color: Colors.black),
                    obscureText: !state.isPasswordVisible,
                    onChanged: (value) => context
                        .read<SignupBloc>()
                        .add(ConfirmPasswordChanged(value)),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          state.isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Appcolors.grey,
                        ),
                        onPressed: () {
                          context
                              .read<SignupBloc>()
                              .add(PasswordVisibilityToggled());
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Submission button / loader
                  if (state.isSubmitting)
                    Center(
                      child: CircularProgressIndicator(
                        color: Appcolors.yellow,
                      ),
                    )
                  else
                    CustomButton(
                      width: width,
                      text: 'Register',
                      textColor: Colors.black,
                      backgroundColor: Appcolors.yellow,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      onPressed: () {
                        if (state.password.isEmpty ||
                            state.confirmPassword.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Please enter all fields")),
                          );
                          return;
                        }
                        if (state.password != state.confirmPassword) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Passwords do not match")),
                          );
                          return;
                        }
Navigator.pushNamed(context, '/home');
                        context.read<SignupBloc>().add(SubmitSignup());
                      },
                    ),
                  SizedBox(height: height * 0.02),

                  // Back to login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SignUpPage(),
                            ),
                          );
                        },
                        icon: Icon(Icons.arrow_back,
                            color: Colors.black),
                      ),
                      Text(
                        "Back to Sign up",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

