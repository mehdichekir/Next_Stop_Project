import 'package:flutter/material.dart';
import 'package:transport_app/widgets/profile_list_tile.dart';
class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile_screen';

  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 10, 51, 85),
        leading: const Icon(Icons.menu, color: Colors.white),
        title: const Text(
          "Transport App",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            color: const Color.fromARGB(255, 10, 51, 85),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                      'assets/farah.jpg'), 
                ),
                 SizedBox(height: 10),
                 Text(
                  'Farah Ben Abdallah',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 SizedBox(height: 5),
                 Text(
                  'Ghazela, Ariana',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                 const CustomListTile(
                  icon: Icons.contact_mail,
                  text: "Contact Information",
                ),
                const SizedBox(height: 20,),
                const CustomListTile(
                  icon: Icons.search,
                  text: "Find a Reservation",
                ),
                const SizedBox(height: 20,),
                const CustomListTile(
                  icon: Icons.notifications,
                  text: "Notifications",
                ),
                const SizedBox(height: 20,),
                const CustomListTile(
                  icon: Icons.history,
                  text: "History",
                ),
                const SizedBox(height: 20,),
                const CustomListTile(
                  icon: Icons.support_agent,
                  text: "Customer Services",
                ),
                const SizedBox(height: 20,),
                ListTile(
                  leading:const Icon(Icons.settings, color: Color.fromARGB(255, 10, 51, 85)),
                  title: const Text(
                    "Account Settings",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

