import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../blocs/login/login_bloc.dart';
import '../blocs/login/login_event.dart';
import '../blocs/login/login_state.dart';
import '../constants/Appcolors.dart';
import '../constants/customButton.dart';
import 'loginPage.dart';

class Verificationpage extends StatelessWidget {
  const Verificationpage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.13),
                Image.asset(
                  "assets/images/lock.png",
                  height: height * 0.18,
                ),
                SizedBox(height: height * 0.08),
                Text(
                  "Enter the verification code we \njust sent you on your email \naddress.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: height * 0.04),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 4,
                    onChanged: (value) {},
                    onCompleted: (value) {
                      // Store OTP in bloc if needed
                      context.read<LoginBloc>().add(ForgotPasswordEmailChanged(value)); // optional use
                    },
                    textStyle: const TextStyle(color: Colors.white),
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: 60,
                      fieldWidth: 70,
                      activeColor: Appcolors.yellow,
                      selectedColor: Colors.white,
                      inactiveColor: Appcolors.grey,
                    ),
                    cursorColor: Appcolors.yellow,
                  ),
                ),


                SizedBox(height: height * 0.015),
                Text.rich(
                  TextSpan(
                    text: "If you didn’t receive a code! ",
                    style: GoogleFonts.poppins(color: Appcolors.grey, fontSize: 14),
                    children: [
                      TextSpan(
                        text: " Resend",
                        style: GoogleFonts.poppins(
                          color: Appcolors.yellow,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Add resend logic here
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Resend OTP clicked")),
                            );
                          },
                      )
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: height * 0.03),


                if (state.isForgotPasswordSubmitting)
                  CircularProgressIndicator(color: Appcolors.yellow)
                else if (state.isForgotPasswordSuccess)
                  Column(
                    children: [
                      const Icon(Icons.check_circle, color: Colors.green, size: 48),
                      const SizedBox(height: 16),
                      Text(
                        "Password reset link sent!",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Check your email to reset your password",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Appcolors.grey,
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      CustomButton(
                        width: width,
                        text: 'Back to Login',
                        textColor: Colors.black,
                        backgroundColor: Appcolors.yellow,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                      ),
                    ],
                  )
                else
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: CustomButton(
                      width: width,
                      text: 'Verify',
                      textColor: Colors.black,
                      backgroundColor: Appcolors.yellow,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      onPressed: () {
                        // Mock submit
                        context.read<LoginBloc>().add(ForgotPasswordSubmitted());

                        // Navigate after success
                        Future.delayed(const Duration(seconds: 2), () {
                          Navigator.pushNamed(context, '/login');
                        });
                      },
                    ),
                  ),
                SizedBox(height: height * 0.02),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider(
                            create: (_) => LoginBloc(),
                            child: const LoginPage(),
                          ),
                        ),
                      );
                    }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
                    Text("Back to Login",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black),)
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
