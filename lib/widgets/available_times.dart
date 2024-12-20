import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AvailableTimes extends StatefulWidget {
  bool isPicked;
  bool isAvailable;
  TimeOfDay departureTime;
  TimeOfDay arrivalTime;
  int busNumber;
  AvailableTimes(
      {required this.departureTime,
      required this.arrivalTime,
      required this.isAvailable,
      required this.busNumber,
      this.isPicked=false});

  @override
  State<AvailableTimes> createState() => _AvailableTimesState();
}

class _AvailableTimesState extends State<AvailableTimes> {
  @override
  Widget build(BuildContext context) {
    String formattedDeparture = widget.departureTime.format(context);
    String formattedArrival = widget.arrivalTime.format(context);
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
            child :widget.isPicked? const Icon(Icons.check_box): const Icon(Icons.check_box_outline_blank),
              onTap:(){
                setState(() {
                  widget.isPicked=!widget.isPicked;
                });
              } ,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('$formattedDeparture - $formattedArrival '),
                  Text('N° ${widget.busNumber}',style: const TextStyle(
                    fontSize: 16
                  ),),
                  Text(
                    widget.isAvailable ? 'Available' : 'Not available',
                    style: TextStyle(
                        color: widget.isAvailable ? Colors.green : Colors.red,
                        fontSize: 17),
                  )
                ],
              ),
            )
          ],
        ),
        const Divider(thickness: 3,color: Colors.black,indent: 50 ,endIndent: 50,height: 30,)
      ],
    );
  }
}
