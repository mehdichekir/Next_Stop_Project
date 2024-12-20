
import 'package:flutter/material.dart';
import 'package:transport_app/screens/means_of_transport/bus_destintaion_screen.dart';
import 'package:transport_app/screens/means_of_transport/metro_destination_screen.dart';
import 'package:transport_app/screens/means_of_transport/train_destination_screen.dart';
import 'package:transport_app/widgets/mean_of_transport.dart';

class ChooseMeanScreen extends StatefulWidget {
  static const routeName = '/choose_Mean_Screen';
  const ChooseMeanScreen({super.key});

  @override
  State<ChooseMeanScreen> createState() => _ChooseMeanScreenState();
}

class _ChooseMeanScreenState extends State<ChooseMeanScreen> {
  String dropDownValue='Select Manually';
  bool locationSelector = false;
  String userLocation = 'Location Not Yet Specified';
  String? userName;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(children: [
         Container(
            padding: const EdgeInsets.only(top: 30),
            color: const Color.fromARGB(255, 18, 77, 122),
            height: 150,
            width: double.maxFinite,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to Next Stop',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(child: Container(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(width: 2, color: Colors.black),
                      left: BorderSide(width: 2, color: Colors.black),
                      right: BorderSide(width: 2, color: Colors.black),
                    ),
                  ),
                  child: SingleChildScrollView(
           child: Stack(
             children:[
              Container(
                alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
                )
              ),
               child: const Column(children: [
                SizedBox(height: 40,),
                MeanOfTransport(title: 'Bus',imageAsset:  'assets/blue-bus-no-bg.png', routeName: BusDestinationScreen.routeName,),
                MeanOfTransport(title: 'Metro',imageAsset:'assets/metro-no-bg.png', routeName: MetroDestinationScreen.routeName,),
                MeanOfTransport(title: 'Train',imageAsset: 'assets/train-no-bg.png',routeName: TrainDestinationScreen.routeName,)
                       ],),
             ),
             Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 30,top: 7),
              child: const Text(
                'Choose Your Transport',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
             )
             ] 
           ),
         ) ,
          ))
         
      ],
      )
         
    );
  }
}