import 'package:flutter/material.dart';
import 'package:transport_app/screens/paiment_screen.dart';
import 'package:transport_app/widgets/available_times.dart';
import 'package:transport_app/widgets/departure_destination_widget.dart';

class ScheduleScreen extends StatefulWidget {
  static const routeName = '/scheduleScreen';
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    var passedData=ModalRoute.of(context)!.settings.arguments as Map<String,String?>;
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 80),
              color: const Color.fromARGB(255, 18, 77, 122),
              height: 290,
              width: double.maxFinite,
              child: const Text(
                'Schedule',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(bottom: 20),
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
                child: Padding(
                  padding: const EdgeInsets.only(top: 150, left: 30, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                       Text(
                        'The Available time for     ${passedData['pickedDate']} :',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return AvailableTimes(
                              departureTime:
                                  const TimeOfDay(hour: 10, minute: 0),
                              arrivalTime: const TimeOfDay(hour: 12, minute: 0),
                              isAvailable: true,
                              busNumber: 2,
                            );
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 40),
                        child: TextButton(
                                    style: TextButton.styleFrom(
                                       backgroundColor: const Color.fromARGB(255, 10, 51, 85),
                                        foregroundColor: Colors.white,
                                    minimumSize: const Size(240, 60),
                                  shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                8.0), 
                          ),),
                                    onPressed: () => Navigator.of(context)
                                        .pushReplacementNamed(PaimentScreen.routeName),
                                    child: const Text(
                                      'Pay Your Ticket',
                                      style: TextStyle(fontSize: 20, color: Colors.white),
                                    )),
                      )
                    ],
                  ),
                ),
              ),
            ),
            
          ],
        ),
        DepartureDestinationWidget(
            departure: passedData['departure'], arrival: passedData['arrival']),
        
      ]),
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
        selectedItemColor: const Color.fromARGB(255, 10, 51, 85),
        unselectedItemColor: Colors.grey.shade600,
        backgroundColor: Colors.white,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
      ),
    );
  }
}
