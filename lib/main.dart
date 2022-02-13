import 'package:decode_squad/authentication/Login/loginScreen.dart';
import 'package:decode_squad/authentication/WelcomeScreen/welcomeScreen.dart';
import 'package:decode_squad/dashboard/mainScreen.dart';
import 'package:decode_squad/constants.dart';
import 'package:decode_squad/referral-system/referral-main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'authentication/Signup/signupScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

DatabaseReference usersRef =
    FirebaseDatabase.instance.reference().child("users");

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medi-Space',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Brand Bold",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MainScreen(),
      initialRoute: WelcomeScreen.idScreen,
      routes: {
        WelcomeScreen.idScreen: (context) => WelcomeScreen(),
        SignupScreen.idScreen: (context) => SignupScreen(),
        LoginScreen.idScreen: (context) => LoginScreen(),
        MainScreen.idScreen: (context) => MainScreen()
      },
    );
  }
}
