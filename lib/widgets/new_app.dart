import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_nav_bar.dart';
import 'package:flutter_application_1/screens/home_screen.dart';

class NewApp extends StatelessWidget {
  const NewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blueAccent,
        primaryColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white70,
          titleTextStyle: TextStyle(
            color: Colors.black87,
            fontSize: 24,
          ),
        ),
      ),
      home: FirebaseAuth.instance.currentUser != null
          ? const HomeNavBar()
          : const HomeScreen(),
      // home: const ItemScreen(),
    );
  }
}
