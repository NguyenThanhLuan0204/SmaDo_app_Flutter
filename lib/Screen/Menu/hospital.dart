import 'package:fit/Screen/Add/Add_Hospital.dart';
import 'package:fit/Screen/Table/hospitalTable.dart';
import 'package:flutter/material.dart';
class HospitalPage extends StatefulWidget {
  @override
  _HospitalPageState createState() => _HospitalPageState();
}

class _HospitalPageState extends State<HospitalPage> {
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
                      MaterialPageRoute(builder: (context) => AddHospital()),
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
          HospitalTable(),
        ],
      )
    );
  }
}