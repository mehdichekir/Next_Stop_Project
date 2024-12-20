import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:transport_app/helpers/functions.dart';
import 'package:transport_app/screens/bottom_navbar.dart';
import 'package:transport_app/screens/homeScreen.dart';

class MultiBuilder extends StatelessWidget {
  const MultiBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: HelpersFunctions.initializeApp(), 
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()), 
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Error: ${snapshot.error}')),
          ); 
        } else {
          return StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(), 
            builder: (context, authSnapshot) {
              if (authSnapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()), 
                );
              } else if (authSnapshot.hasError) {
                return Scaffold(
                  body: Center(child: Text('Error: ${authSnapshot.error}')),
                );
              } else if (authSnapshot.hasData) {
                
                return const BottomNavbar(); 
              } else {
                return const HomePage(); 
              }
            },
          );
        }
      },
    );
  }
}







