import 'package:fit/models/PatientTreatedModel.dart';
import 'package:fit/models/hospitalModel.dart';
import 'package:flutter/material.dart';

class PatientTreatedDetail extends StatefulWidget {
  PatientTreated patientTreated;
  PatientTreatedDetail({Key? key, required this.patientTreated}) : super(key: key);
  @override
  _PatientTreatedDetailState createState() => _PatientTreatedDetailState();
}

class _PatientTreatedDetailState extends State<PatientTreatedDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF5E135E),
          title: Text("Chi tiết bệnh nhân"),
          actions: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                bool confirm = await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Confirm'),
                      content: Text('Are you sure you want to delete this item?'),
                      actions: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF5E135E),
                          ),
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF5E135E),
                          ),
                          child: Text('Delete'),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                        ),
                      ],
                    );
                  },
                );
                if (confirm) {
                  // Perform the delete action
                }
              },
            ),

          ],
        ),
        body: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.patientTreated.name!,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text("Tuổi: "+
                        widget.patientTreated.age!.toString(),
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 8,),
                      Text("Email: "+
                        widget.patientTreated.email!,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text("Số điện thoại: "+
                        widget.patientTreated.phone!,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text("CCCD/CMND: "+
                        widget.patientTreated.CCCD!,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 8.0),
                    ],
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF5E135E),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.edit),
                        Text('Chỉnh sửa'),
                      ],
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Chỉnh sửa thông tin"),
                            content: Form(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextFormField(
                                    decoration: InputDecoration(labelText: "Tên"),
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(labelText: "Tuổi"),
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(labelText: "Email"),
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(labelText: "Số Điện Thoại"),
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(labelText: "CCCD/CMND"),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF5E135E),
                                ),
                                child: Text("Cancel"),
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                              ),
                              ElevatedButton( style: ElevatedButton.styleFrom(
                                primary: Color(0xFF5E135E),
                              ),
                                child: Text("Save"),
                                onPressed: () {
                                  // Add your code here to save the changes
                                  Navigator.of(context).pop(true);
                                },
                              ),
                            ],
                          );
                        },
                      );

                    },
                  ),
                ),
              ],
            )
        )
    );
  }
}