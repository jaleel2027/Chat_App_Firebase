import 'dart:async';
import 'package:chat_app/screens/WelcomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screens/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//TODO 1: import firebase core and auth packages



//TODO 2: Make void main to Future<void> main

void main() {
  //TODO 3: Initialise widgets and firebase app

  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(FirstScreen());
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  //TODO 8: create auth service instance

  //TODO 4: create a Firebase User
  @override
  void initState() {
    // TODO 5: initialise the User
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xffCA26FF),
          colorScheme: ColorScheme.fromSwatch(
              primaryColorDark: Color(0xffFFF3B0),
              accentColor: Color(0xff37007C))),
      debugShowCheckedModeBanner: false,
      //TODO 9: Based on existence of user set initial route
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginScreen(),
        'welcome': (context) => WelcomeScreen(),
      },
    );
  }
}
//TODO(must) : provide streams in messages and welcome screen to avoid the getter not defined error in the line 'snapshot.data!.docs'
//Go to services/auth_services.dart