import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen.dart';

class AppAuthentication {
  static Future home(
      {required String Email, required String ID, required context}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: Email,
        password: ID,
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 5),
          backgroundColor: Colors.red,
          content: Text(
            '${e.message}',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
      // if (e.code == 'weak-password') {
      // print('The password provided is too weak.');
      //} else if (e.code == 'email-already-in-use') {
      // print('The account already exists for that email.');
      // }
    } catch (e) {
      print(e);
    }
  }

  ////////////////////////////////////////////////////////
  static Future signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
      (route) => false,
    );
  }
}
