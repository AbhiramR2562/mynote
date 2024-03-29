import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/services/authentication/login_or_register.dart';
import 'package:my_notes/view/screens/home_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // User is logged in
            if (snapshot.hasData) {
              return HomeScreen();
            } else {
              // User is not logged in
              return const LoginOrRegister();
            }
          }),
    );
  }
}
