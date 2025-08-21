import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garraribikes/constants/bottomBar.dart';
import 'package:garraribikes/screens/account/aboutUs.dart';
import 'package:garraribikes/screens/account/account.dart';
import 'package:garraribikes/screens/account/editProfile.dart';
import 'package:garraribikes/screens/account/orders.dart';
import 'package:garraribikes/screens/account/profileScreen.dart';
import 'package:garraribikes/screens/payment/Payment.dart';
import 'package:garraribikes/screens/EditProfilePage.dart';
import 'package:garraribikes/screens/Privacypolicy.dart';
import 'package:garraribikes/screens/home/notification.dart' hide Notification;
import 'package:garraribikes/screens/SignupPage.dart';
import 'package:garraribikes/blocs/home/home_bloc.dart';
import 'package:garraribikes/screens/Terms&conditions.dart';
import 'package:garraribikes/screens/cart/cart.dart';
import 'package:garraribikes/screens/cart/savedAddress.dart';
import 'package:garraribikes/screens/account/contactUs.dart';
import 'package:garraribikes/screens/forgotPassword.dart';
import 'package:garraribikes/screens/loginPage.dart';
import 'package:garraribikes/screens/payment/orderSuccess.dart';
import 'package:garraribikes/screens/resetPassword.dart';
import 'package:garraribikes/screens/splashscreen.dart';
import 'package:garraribikes/screens/home/homePage.dart';
import 'package:garraribikes/screens/verificationPage.dart';

import 'blocs/account/account_bloc.dart';
import 'blocs/cart/cart_bloc.dart';
import 'blocs/login/login_bloc.dart';
import 'blocs/signup/signup_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => LoginBloc()),
      BlocProvider(create: (_) => HomeBloc()),
      BlocProvider(create: (_) => CartBloc()),
      BlocProvider(create: (_) => AccountBloc())
    ],
    child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      routes: {
        '/signup': (context) => const SignUpPage(),
        '/signup2': (context) => BlocProvider.value(
          value: BlocProvider.of<SignupBloc>(context),
          child: const Signuppage2(),
        ),
        '/verification': (context) => const Verificationpage(),
        '/orderSuccess':(context) =>Ordersuccess(),
        '/profile':(context) =>Profilescreen(),
        '/login':(context) => LoginPage(),
        '/editProfile':(context) => Editprofile(),
        '/account':(context) => Account(),
        '/orders':(context) => Orders(),
         '/aboutUs':(context) => Aboutus(),
        '/contactUs':(context) => ContactUs(),
        '/forgotPassword': (context) => BlocProvider(
          create: (_) => LoginBloc(),
          child: Forgotpassword(),
        ),
        '/bottombar':(context) => MainNavigation(),
        '/cart':(context) => Cart(),
        '/savedAddress':(context) => SavedAddress(),
        '/editProfile': (context) => Editprofile(),
        '/privacyPolicy': (context) => Privacypolicy(),
        '/terms': (context) => Termsandconditions(),
        '/notification':(context) => Notifications(),
        '/payment': (context) => Payment(),
        '/home': (context) => BlocProvider(
          create: (_) => HomeBloc(),
          child: const HomePage(),
        ),


      },
    );
  }
}

