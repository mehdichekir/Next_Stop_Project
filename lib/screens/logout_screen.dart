import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:transport_app/screens/homeScreen.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const  Color.fromARGB(255, 18, 77, 122),
      ),
      backgroundColor: const Color.fromARGB(255, 18, 77, 122),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 18, 77, 122),
              height: 200,
              width: double.maxFinite,
              child: Image.asset(
                'assets/logo-no-bg.png',
                height: 200, 
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                color: Colors.white,
                border: Border(
                  top: BorderSide(width: 2, color: Colors.black), // Border on top
                  left: BorderSide(width: 2, color: Colors.black), // Border on left
                  right: BorderSide(width: 2, color: Colors.black), // Border on right
                ),
              ),
              child: Container(
                height: 520,
        padding: const EdgeInsets.only(right: 20,left: 20,bottom: 50,top: 30),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Column(
              children: [
                const Text('Are you sure you want to',style: TextStyle(fontSize: 30),),
                const Text('Logout?',style: TextStyle(fontSize: 30),textAlign: TextAlign.center,),
                const SizedBox(height: 150,),
                TextButton(onPressed: (){
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacementNamed(HomePage.routeName);
                },
                 style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                minimumSize: const Size(320, 60),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                                  8.0), 
                            ),),
                 child: const Text('Logout'),
        
                            ),
                            const SizedBox(height: 35,),
                            TextButton(onPressed: (){},
                 style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                minimumSize: const Size(320, 60),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                                  8.0), 
                            ),),
                 child: const Text('Cancel'),
                            ),
              ],
            ),
            
          ],
        ),
            )),
          ],
        ),
      ),
    );}}
//       body: Container(
//         padding: EdgeInsets.only(right: 20,left: 20,bottom: 50),
//         width: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//              Column(
//               children: [
//                 const Text('Are you sure you want to',style: TextStyle(fontSize: 30),),
//                 const Text('Logout?',style: TextStyle(fontSize: 30),textAlign: TextAlign.center,),
//                 const SizedBox(height: 200,),
//                 TextButton(onPressed: (){
//                   FirebaseAuth.instance.signOut();
//                   Navigator.of(context).pushReplacementNamed(HomePage.routeName);
//                 },
//                  style: TextButton.styleFrom(
//                 backgroundColor: Colors.red,
//                 foregroundColor: Colors.white,
//                 minimumSize: const Size(320, 60),
//                 shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(
//                                   8.0), 
//                             ),),
//                  child: const Text('Logout'),
        
//                             ),
//                             SizedBox(height: 35,),
//                             TextButton(onPressed: (){},
//                  style: TextButton.styleFrom(
//                 backgroundColor: Colors.black,
//                 foregroundColor: Colors.white,
//                 minimumSize: const Size(320, 60),
//                 shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(
//                                   8.0), 
//                             ),),
//                  child: const Text('Cancel'),
//                             ),
//               ],
//             ),
            
//           ],
//         ),
//       ),
//     );
//   }
// }