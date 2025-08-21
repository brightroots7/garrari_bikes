import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garraribikes/constants/Appcolors.dart';
import 'package:garraribikes/constants/customButton.dart';
import 'package:google_fonts/google_fonts.dart';

import '../blocs/login/login_bloc.dart';
import '../blocs/login/login_event.dart';
import '../blocs/login/login_state.dart';
import 'loginPage.dart';

class Forgotpassword extends StatelessWidget {
  const Forgotpassword({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<LoginBloc, LoginState>(
        listenWhen: (previous, current) =>
            previous.isForgotPasswordSuccess != current.isForgotPasswordSuccess,
        listener: (context, state) {
          if (state.isForgotPasswordSuccess) {
            Navigator.pushNamed(context, '/verification');
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.13),
                    Center(
                      child: Image.asset(
                        "assets/images/key.png",
                        height: height * 0.15,
                      ),
                    ),
                    SizedBox(height: height * 0.08),
                    Center(
                      child: Text(
                        "Enter the email address \nassociated with your account.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Center(
                      child: Text(
                        "We will email you a link to reset your \npassword.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Appcolors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.06),
                    Text(
                      "Email",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    TextField(
                      style: const TextStyle(color: Colors.white),
                      onChanged: (value) => context.read<LoginBloc>().add(
                        ForgotPasswordEmailChanged(value),
                      ),
                      decoration: InputDecoration(
                        hintText: "Enter your email",
                        hintStyle: TextStyle(color: Appcolors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.03),

                    if (state.isForgotPasswordSubmitting)
                      Center(
                        child: CircularProgressIndicator(
                          color: Appcolors.yellow,
                        ),
                      )
                    else if (state.isForgotPasswordSuccess)
                      Column(
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 48,
                          ),
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
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      )
                    else
                      CustomButton(
                        width: width,
                        text: 'Send',
                        textColor: Colors.black,
                        backgroundColor: Appcolors.yellow,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/verification',
                            arguments: state.forgotPasswordEmail,
                          );

                          if (state.forgotPasswordEmail.isNotEmpty) {
                            context.read<LoginBloc>().add(
                              ForgotPasswordSubmitted(),
                            );
                          }
                        },
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
                        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
                        Text("Back to Login",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w400,color:Colors.black),)
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
