import 'package:fit/models/hospitalModel.dart';
import 'package:flutter/material.dart';

class HospitalDetail extends StatefulWidget {
  Hospital hospital;
  HospitalDetail({Key? key, required this.hospital}) : super(key: key);
  @override
  _HospitalDetailState createState() => _HospitalDetailState();
}

class _HospitalDetailState extends State<HospitalDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5E135E),
        title: Text("Hospital Detail"),
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
                  Text(widget.hospital.name!,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    widget.hospital.address!,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
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
                              decoration: InputDecoration(labelText: "Name"),
                            ),
                            TextFormField(
                              decoration: InputDecoration(labelText: "Địa chỉ"),
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
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
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
          ],
        )
      )
    );
  }
}