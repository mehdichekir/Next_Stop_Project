import 'package:flutter/material.dart';
import 'package:transport_app/screens/bottom_navbar.dart';

class ReservationValidatedScreen extends StatelessWidget {
  static const routeName = '/Reservation_valid_screen';

  const ReservationValidatedScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: const Color.fromARGB(255, 18, 77, 122),
                height: 290,
                width: double.maxFinite,
                child: Image.asset(
                  'assets/logo-no-bg.png',
                  height: 300,
                ),
              ),
              Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(
                          width: 2, color: Colors.black), // Border on top
                      left: BorderSide(
                          width: 2, color: Colors.black), // Border on left
                      right: BorderSide(
                          width: 2, color: Colors.black), // Border on right
                    ),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 290,
                    padding: const EdgeInsets.only(top: 70, right: 20, left: 20),
                    child: Column(
                      children: [
                        const Text(
                          'Reservation Validated',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Image.asset(
                          'assets/check-removebg-preview.png',
                          height: 200,
                          width: 200,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                       const  Text(
                          'Thank you for using',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'NEXTSTOP',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                                       backgroundColor: const Color.fromARGB(255, 10, 51, 85),
                                        foregroundColor: Colors.white,
                                    minimumSize: const Size(240, 60),
                                  shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                8.0), 
                          ),),
                            onPressed: ()=>Navigator.of(context).pushReplacementNamed(BottomNavbar.routeName),
                            child: const  Text('Go Back Home',style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                            ),))
                      ],
                    ),
                  )),
            ],
          ),
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
      
      
      
      
      
      
      
      
      
      
    