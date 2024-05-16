import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String fecha;
  final String start;
  final String end;
  final String workingHours;
  final String breakHours;
  final String state;

  const CustomCard({
    required this.fecha,
    required this.start,
    required this.end,
    required this.workingHours,
    required this.breakHours,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fecha: $fecha',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text('Start: $start'),
            Text('End: $end'),
            Text('Working Hours: $workingHours'),
            Text('Break Hours: $breakHours'),
            Text(
              'State: $state',
              style: TextStyle(
                color: state == 'Completed' ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}