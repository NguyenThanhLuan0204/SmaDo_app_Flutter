import 'package:fit/Screen/Add/Add_Hospital.dart';
import 'package:fit/Screen/Add/Add_Patient.dart';
import 'package:fit/Screen/Table/PatientTreatedTable.dart';
import 'package:fit/Screen/Table/hospitalTable.dart';
import 'package:flutter/material.dart';


class Patient_treated extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Patient_treated> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF5E135E),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Add'),
                        Icon(Icons.add),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddPatient()),
                      );
                    },
                  ),
                  Container(
                    width:200,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search...',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            PatientTreatedTable(),
          ],
        )
    );
  }
}

