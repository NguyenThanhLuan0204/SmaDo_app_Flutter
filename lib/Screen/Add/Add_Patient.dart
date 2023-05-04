import 'package:flutter/material.dart';

class AddPatient extends StatefulWidget {
  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5E135E),
        title: Text("Add Patient"),
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
              decoration: InputDecoration(labelText: 'Tuổi'),
              validator: (value) {
                if (value!.length ==0) {
                  return 'Please enter an address';
                }
                return null;
              },
              onSaved: (value) {

              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
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
              decoration: InputDecoration(labelText: 'Số Điện Thoại'),
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
              decoration: InputDecoration(labelText: 'CCCD/CMND'),
              validator: (value) {
                if (value!.length ==0 ) {
                  return 'Please enter a name';
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