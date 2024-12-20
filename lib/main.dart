
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:transport_app/helpers/auht_wrapper.dart';

import 'package:transport_app/screens/Reservation_validated_screen.dart';
import 'package:transport_app/screens/auth_screen.dart';
import 'package:transport_app/screens/bottom_navbar.dart';
import 'package:transport_app/screens/homeScreen.dart';
import 'package:transport_app/screens/means_of_transport/bus_destintaion_screen.dart';
import 'package:transport_app/screens/means_of_transport/metro_destination_screen.dart';
import 'package:transport_app/screens/means_of_transport/train_destination_screen.dart';
import 'package:transport_app/screens/paiment_screen.dart';
import 'package:transport_app/screens/profile_screen.dart';
import 'package:transport_app/screens/schedule_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCGQCKF0ZuOUuCgPHwXVyfTcLelowyqnvE", 
      appId: "com.example.transport_app", 
      messagingSenderId: "628109126126", 
      projectId: "transport-app-7ec0a", 
      authDomain: "transport-app-7ec0a.firebaseapp.com", 
      storageBucket: "transport-app-7ec0a.firebasestorage.app", 
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Transport_app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBuilder(),
      routes: {
        HomePage.routeName:(context)=>HomePage(),
        BusDestinationScreen.routeName:(context)=>BusDestinationScreen(),
        TrainDestinationScreen.routeName:(context)=>TrainDestinationScreen(),
        MetroDestinationScreen.routeName:(context)=>MetroDestinationScreen(),
        ScheduleScreen.routeName:(context)=>ScheduleScreen(),
        BottomNavbar.routeName:(context)=>BottomNavbar(),
        PaimentScreen.routeName:(context)=>PaimentScreen(),
        ReservationValidatedScreen.routeName:(context)=>ReservationValidatedScreen(),
        ProfileScreen.routeName:(context)=>ProfileScreen(),
        AuthScreen.routeName:(context)=>AuthScreen()

      },
    );
  }
}


