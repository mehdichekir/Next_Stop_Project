import 'package:flutter/material.dart';

class DepartureDestinationWidget extends StatefulWidget {
  final String? departure;
  final String ?arrival;
  const DepartureDestinationWidget({required this.departure,required this.arrival});

  @override
  State<DepartureDestinationWidget> createState() => _DepartureDestinationWidgetState();
}

class _DepartureDestinationWidgetState extends State<DepartureDestinationWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
          top: 150,
          left: 60,
          right: 60,
          child: Card(
            child: Container(
              padding: const EdgeInsets.all(30),
              height: 250,
              width: 300,
              child: Column(children: [
                const Row(
                  children: [
                    Icon(Icons.location_on,size: 40,color: Colors.blue,),
                    Text('From',style: TextStyle(
                      color:  Color.fromARGB(255, 24, 73, 113),
                      fontSize: 25
                    ),)

                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 36),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('${widget.departure}',style: const TextStyle(
                        fontSize: 25,
                        color:  Color.fromARGB(255, 24, 73, 113),
                      ),),
                    ],
                  ),
                ),
                const Divider(thickness: 3,color: Colors.black,endIndent: 30,indent: 30,height: 30,),
                Container(
                  margin: const  EdgeInsets.only(left: 36),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('To',style: TextStyle(
                        fontSize: 25,
                        color:  Color.fromARGB(255, 24, 73, 113),
                      ),),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.location_on,size: 40,),
                    Text('${widget.arrival}',style: const  TextStyle(
                      fontSize: 25,
                      color:  Color.fromARGB(255, 24, 73, 113),
                    ),)
                  ],
                )
              ],),
            ),
          ));
  }
}