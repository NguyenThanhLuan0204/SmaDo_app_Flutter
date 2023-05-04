import 'package:flutter/material.dart';

class AddHospital extends StatefulWidget {
  @override
  _AddHospitalState createState() => _AddHospitalState();
}

class _AddHospitalState extends State<AddHospital> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5E135E),
        title: Text("Add Hospital"),
      ),
      body:Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value!.length ==0 ) {
                  return 'Please enter a name';
                }
                return null;
              },
              onSaved: (value) {

              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Address'),
              validator: (value) {
                if (value!.length ==0) {
                  return 'Please enter an address';
                }
                return null;
              },
              onSaved: (value) {

              },
            ),
            ElevatedButton(
              child: Text('Confirm'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF5E135E)
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Perform the confirm action
                }
              },
            ),
          ],
        ),
      ),
    );
  }}