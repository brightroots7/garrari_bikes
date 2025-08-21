import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garraribikes/blocs/login/login_bloc.dart';
import 'package:garraribikes/blocs/login/login_state.dart';
import 'package:garraribikes/blocs/login/login_event.dart';
import 'package:garraribikes/constants/Appcolors.dart';
import 'package:garraribikes/screens/forgotPassword.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/customButton.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),),
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                    SizedBox(height: height * 0.017),
                Text(
                  "Welcome back",
                  style: GoogleFonts.poppins(fontSize: 32, color: Colors.black,fontWeight:FontWeight.w600 ),
                ),
                SizedBox(height: height * 0.01),
                Text(
                  "Log in to continue your cycling adventure.",
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.black,fontWeight:FontWeight.w400),
                ),
                SizedBox(height: height * 0.05),
                Text(
                  "Email",
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.black,fontWeight:FontWeight.w400),
                ),
                SizedBox(height: height * 0.01),
                TextField(
                  style: GoogleFonts.poppins(color: Colors.white),
                  onChanged: (value) =>
                      context.read<LoginBloc>().add(EmailChanged(value)),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),),
                  SizedBox(height: height * 0.02),
                  Text(
                    "Password",
                    style: GoogleFonts.poppins(fontSize: 16, color: Colors.black,fontWeight:FontWeight.w400),
                  ),
                  SizedBox(height: height * 0.01),
                  TextField(
                    style: GoogleFonts.poppins(color: Colors.white),
                    obscureText: !state.isPasswordVisible, // FIXED: Add this line
                    onChanged: (value) =>
                        context.read<LoginBloc>().add(PasswordChanged(value)),
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            state.isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Appcolors.grey, // Added color for better visibility
                          ),
                          onPressed: () {
                            context.read<LoginBloc>().add(PasswordVisibilityToggled());
                          },
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/forgotPassword');
                      },

                      child: Text("Forgot password?",style: TextStyle(color: Colors.black),),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  CustomButton(text: 'Login',fontSize:16,textColor: Colors.black, onPressed: (){
                    context.read<LoginBloc>().add(LoginSubmitted());
                    Navigator.pushNamed(context, '/bottombar');
                  },backgroundColor: Appcolors.yellow,borderRadius: 10,width: width,fontWeight: FontWeight.w500,),
                  SizedBox(height: height * 0.02),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Appcolors.grey.withOpacity(0.5),
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
                      icon: Icon(Icons.apple, size: 24, color: Colors.white),
                      label: Text(
                        "Log in with Apple",
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
                  Container(decoration: BoxDecoration(
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
                        "Log in with Google",
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
                        "Don’t have an account?",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: Text(
                          "Sign up",
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
              );
            },
          ),
        ),
      ),
    );
  }
}

