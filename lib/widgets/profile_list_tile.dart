import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;

  const CustomListTile({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: const Color.fromARGB(255, 10, 51, 85)),
      title: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      onTap: () {
        // Action lors du clic
      },
    );
  }
}
