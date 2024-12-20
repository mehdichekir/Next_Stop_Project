import 'package:flutter/material.dart';
import 'package:transport_app/helpers/functions.dart';
import 'package:transport_app/screens/Schedule_screen.dart';

class TrainDestinationScreen extends StatefulWidget {
  static const routeName = '/train_destination_screen';
  const TrainDestinationScreen({super.key});

  @override
  State<TrainDestinationScreen> createState() =>
      _BusDestinationScreenState();
}

class _BusDestinationScreenState extends State<TrainDestinationScreen> {
  TextEditingController dateController = TextEditingController();
  String? selectedStartLocation;
  String? selectedDestination;
  void selectDate() {
    showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      initialDate: DateTime.now(),
      lastDate: DateTime(2025),
    ).then((date) {
      if (date != null) {
        setState(() {
          dateController.text = date.toString().split(" ")[0];
        });
      }
    });
  }

 var trainStartLocationList=HelpersFunctions.trainPossibleWays.map((item){
  return item['depart'];
 });
 var trainDestinationsLocationList=HelpersFunctions.trainPossibleWays.map((item){
  return item['arrivé'];
 });
 var destinationOptions=HelpersFunctions.trainPossibleWays.map((item){
  return item['arrivé'];
 });
 var trainWays=HelpersFunctions.trainPossibleWays;
  @override
  Widget build(BuildContext context) {
    var passedData=ModalRoute.of(context)!.settings.arguments as Map<String,String>;
    return Scaffold(
      body:  Column(
          children: [
             Container(
              padding: const EdgeInsets.only(top: 30),
              color: const Color.fromARGB(255, 18, 77, 122),
              height: 290,
              width: double.maxFinite,
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    passedData['title']!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Image.asset(passedData['imageAsset']!,width: 600,height: 200,)
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 20,right: 20,left: 20),
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
                child:Column(children: [
                 const Text('Choose Your Destination',style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),),
                  const SizedBox(height: 40,),
                   DropdownButtonFormField<String>(
              value: selectedStartLocation,
              hint: const Text('Choose Start Location'),
              items: trainStartLocationList.toSet().toList().map((location){
                return DropdownMenuItem(
                  value: location.toString(),
                  child: Text(location),
                  );
              }).toList(),
                 onChanged: (String? newValue) {
                setState(() {
                  selectedStartLocation = newValue;
                  selectedDestination = null;
                  if (newValue != null) {
                    destinationOptions = trainWays
                        .where(
                            (locationMap) => locationMap['depart']==newValue)
                        .map((locationMap){
                          return locationMap['arrivé'];
                        }).toList();
                  } else {
                    destinationOptions = [];
                  }
                });
              },
              decoration: const InputDecoration(
                labelText: 'Start Location',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 40),

            // Destination Dropdown
            DropdownButtonFormField<String>(
              value: selectedDestination,
              hint: const Text('Choose Destination'),
              items: destinationOptions
                  .map((destination) {
                    return DropdownMenuItem(
                        value: destination.toString(),
                        child: Text(destination.toString()));
                  })
                  .toSet()
                  .toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedDestination = newValue;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Destination',
                border: OutlineInputBorder(),
              ),
              // Disable dropdown if no start location is selected
              validator: (value) {
                if (selectedStartLocation == null) {
                  return 'Please select a start location first';
                }
                return null;
              },
            ),
            const SizedBox(height: 40,),
             Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.calendar_today, size: 30),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              controller: dateController,
                              readOnly: true,
                              decoration: const InputDecoration(
                                labelText: 'Pick a date',
                                suffixIcon: Icon(Icons.calendar_month),
                                border: OutlineInputBorder(),
                              ),
                              onTap: selectDate,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 70,),

                       TextButton(

              onPressed: () {
                if (selectedStartLocation != null &&
                    selectedDestination != null) {
                      Navigator.of(context).pushNamed(ScheduleScreen.routeName,arguments: {
                        'departure':selectedStartLocation,
                        'arrival':selectedDestination,
                        'pickedDate':dateController.text
                      });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content:
                            Text('Please select both start and destination')),
                  );
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 10, 51, 85),
                foregroundColor: Colors.white,
                minimumSize: const Size(240, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Rectangle shape with rounded corners
    ),
              ),
              child: const Text('Next',style: TextStyle(fontSize: 20),),
            ),
                
                ],)
              )
              ),
           

           
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.train),
            label: 'Tranport',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: ' Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
        selectedItemColor:const  Color.fromARGB(255, 10, 51, 85),
        unselectedItemColor: Colors.grey.shade600,
        backgroundColor: Colors.white,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
      ),
    );
  }
}
