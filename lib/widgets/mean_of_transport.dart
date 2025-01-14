import 'package:flutter/material.dart';

class MeanOfTransport extends StatelessWidget {
  final String routeName;
  final String title;
  final String imageAsset;
  const MeanOfTransport({super.key,
   required this.title,
   required this.imageAsset,
   required this.routeName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigator.of(context).pushNamed(routeName,arguments: {
        'title': title,
        'imageAsset':imageAsset
      }),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            color: const Color.fromARGB(255, 18, 77, 122),
            padding: const EdgeInsets.only(top: 20, left: 30, bottom: 20),
            height: 170,
            width: 650,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 30, color: Colors.white)),
                    TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: const Size(70, 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(0),
                      ),
                      onPressed: null,
                      label: const Text('Select', style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
                Expanded(  
                  child: Container(
      
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Image.asset(
                      imageAsset, 
                      fit: BoxFit.cover,  
                       
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
