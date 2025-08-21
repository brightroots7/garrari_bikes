import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garraribikes/constants/Appcolors.dart';
import 'package:garraribikes/constants/customButton.dart';
import 'package:google_fonts/google_fonts.dart';

import '../blocs/login/login_bloc.dart';
import 'loginPage.dart';

class Landingpage extends StatelessWidget {
  const Landingpage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/landingimage.png",),
                fit: BoxFit.fill,
              ),
            ),
          ),


          Container(
            height: height,
            width: width,
            color: Appcolors.appColor.withOpacity(0.85),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.6),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      "Let's",
                      style: GoogleFonts.poppins(
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      "Get You Rolling!",
                      style: GoogleFonts.poppins(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
                    child: Text(
                      "Login or sign up to start your cycling \njourney.",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.05),

                  // Get Started Button (previously Sign Up)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                    child: CustomButton(
                      text: 'Get Started',
                      fontSize: 16,
                      textColor: Colors.black,
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      backgroundColor:Appcolors.yellow,
                      borderRadius: 10,
                      width: width,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  // Already have an account? Login
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BlocProvider(
                                  create: (_) => LoginBloc(),
                                  child: const LoginPage(),
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "Login",
                            style: GoogleFonts.poppins(
                              color: Appcolors.yellow,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
