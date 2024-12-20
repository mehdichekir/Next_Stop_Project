import 'package:flutter/material.dart';
import 'auth_screen.dart';
class HomePage extends StatelessWidget {
  static const routeName = '/HomePage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 33),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/greeting_image.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4),
                    BlendMode.darken,
                  ),
                ),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: Column(
                children: [
                   Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //   'NextStop',
                        //   style: TextStyle(
                        //     fontSize: 40.0,
                        //     fontWeight: FontWeight.bold,
                        //     color: Colors.white,
                        //   ),
                        // ),
                        SizedBox(height: 10),
                        Container(
                          margin: EdgeInsets.only(top: 40,left: 20),
                          padding: const EdgeInsets.only(top: 10,bottom: 10,left: 40,right: 40),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: const Border(
                              top: BorderSide(width: 3, color:  Color.fromARGB(255, 10, 51, 85)),
                      left: BorderSide(width: 3, color:  Color.fromARGB(255, 10, 51, 85)),
                      right: BorderSide(width: 3, color:  Color.fromARGB(255, 10, 51, 85)),
                      bottom: BorderSide(width: 3,color:  Color.fromARGB(255, 10, 51, 85))
                            )
                          ),
                          child: Column(children: [
                             Text(
                          'Are You Fed Up Of',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 171, 178, 193),
                          ),
                        ),
                        Text(
                          'Catching Your Transport?',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                          ],),
                        )
                       
                      ],
                    ),
                  ),
                  Spacer(),
                  // Central section with image and text
                  Column(
                    children: [
                      Image.asset(
                        'assets/logo-no-bg.png',
                        height: 300,
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Make It Easy',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        'With NEXTSTOP',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 171, 178, 193),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      // const Text(
                      //   '      Your platform for seamless '
                      //       'public '
                      //       ''
                      //       '      transport in Tunisia.',
                      //   style: TextStyle(
                      //     fontSize: 18.0,
                      //     color: Colors.white,
                      //   ),
                      //   textAlign: TextAlign.center,
                      // ),
                    ],
                  ),
                  const Spacer(flex: 1),
                  // Get Started Button
                  Column(
                    children: [
                     TextButton(
                    style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 10, 51, 85),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(240, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rectangle shape with rounded corners
            ),
                ),
                    onPressed: (){
                     
                      
                      
                        Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
                      
        
                      },
                    child:const  Text('Get Started',style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
                     const SizedBox(height: 20),
                      const Text(
                        'NextStop - Optimize your trips, enjoy your time',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
