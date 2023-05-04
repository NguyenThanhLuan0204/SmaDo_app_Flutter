import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _channel = WebSocketChannel.connect(
    Uri.parse('ws://165.22.55.235:5000'),
  );
  @override
  Widget build(BuildContext context) {
    _channel.sink.add('{"event":"sync","data":{"warning":"LuanTestAuto"}}');
    var heartbeat;
    var spo2;
    var temp;
    return FutureBuilder<String>(
      future: getDashboardNumber(),
      builder: (context,snapshotDashboard) {
        if(snapshotDashboard.hasData){
          List<String> dataDashboard;
          dataDashboard = snapshotDashboard.data!.replaceAll("[", "").replaceAll("]", "").split(",").map((e) => e).toList();
       var patients=dataDashboard[0];
        var iotdevice=dataDashboard[1];
        var hospital=dataDashboard[2];
          return StreamBuilder(
              stream: _channel.stream,
              builder: (context, snapshot) {
                snapshot.hasData?print("websocket: "+snapshot.data!):print("NaN");
                SocketData socketData;
                List<String> data;
                snapshot.hasData?{
                  socketData=SocketData.fromJson(jsonDecode(snapshot.data!)),
                  data = socketData.message!.split(",").map((e) => e).toList(),
                  heartbeat=data[0],
                  spo2=data[1],
                  temp=data[2],
                }:{
                  heartbeat="NaN",
                  spo2="NaN",
                  temp="NaN",
                };
                return FutureBuilder<bool>(
                    future: isAdmin(),
                    builder: (context,snapshot1) {
                      if(snapshot1.hasData){
                        bool isAdmin= snapshot1.data!;
                        return Container(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  isAdmin ?InkWell(
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [Colors.yellow, Colors.orange],
                                          ),
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10)
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        margin: const EdgeInsets.all(20.0),
                                        child: Container(
                                            margin: const EdgeInsets.all(20.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(patients.toString(), style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),),
                                                    Text('Patients', style: TextStyle(fontSize: 20))
                                                  ],
                                                ),
                                                Container(
                                                  width: 100,
                                                  height: 100,
                                                  child: Image.asset('images/icons/patient_tr.png'),
                                                ),
                                              ],
                                            )
                                        ),
                                      )):Container(),
                                  isAdmin? InkWell(
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [Colors.cyanAccent, Color(0xFF5E135E)],
                                          ),
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10)
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        margin: const EdgeInsets.all(20.0),
                                        child: Container(
                                            margin: const EdgeInsets.all(20.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(iotdevice.toString(), style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),),
                                                    Text('Device', style: TextStyle(fontSize: 20))
                                                  ],
                                                ),
                                                Container(
                                                  width: 100,
                                                  height: 100,
                                                  child: Image.asset('images/icons/medical_device.png'),
                                                ),
                                              ],
                                            )
                                        ),
                                      )):Container(),
                                  InkWell(
                                      onTap: () {
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [Colors.deepPurpleAccent, Color(0xFF5E135E)],
                                          ),
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10)
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        margin: const EdgeInsets.all(20.0),
                                        child: Container(
                                            margin: const EdgeInsets.all(20.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(hospital.toString(), style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),),
                                                    Text('Hospital', style: TextStyle(fontSize: 20))
                                                  ],
                                                ),
                                                Container(
                                                  width: 100,
                                                  height: 100,
                                                  child: Image.asset('images/icons/hospital.png'),
                                                ),
                                              ],
                                            )
                                        ),
                                      )),
                                  InkWell(
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [Colors.pinkAccent, Colors.purple],
                                          ),
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10)
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        margin: const EdgeInsets.all(20.0),
                                        child: Container(
                                            margin: const EdgeInsets.all(20.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(heartbeat.toString(), style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),),
                                                    Text('Hearthbeat', style: TextStyle(fontSize: 20))
                                                  ],
                                                ),
                                                Container(
                                                  width: 100,
                                                  height: 100,
                                                  child: Image.asset('images/icons/heartbeat.png'),
                                                ),
                                              ],
                                            )
                                        ),
                                      )),
                                  InkWell(
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [Colors.indigoAccent, Colors.deepPurple],
                                          ),
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10)
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        margin: const EdgeInsets.all(20.0),
                                        child: Container(
                                            margin: const EdgeInsets.all(20.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(spo2.toString(), style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),),
                                                    Text('SPO2', style: TextStyle(fontSize: 20))
                                                  ],
                                                ),
                                                Container(
                                                  width: 100,
                                                  height: 100,
                                                  child: Image.asset('images/icons/oxygen.png'),
                                                ),
                                              ],
                                            )
                                        ),
                                      )),
                                  InkWell(
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [Colors.yellow, Colors.indigo],
                                          ),
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10)
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        margin: const EdgeInsets.all(20.0),
                                        child: Container(
                                            margin: const EdgeInsets.all(20.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(temp.toString(), style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),),
                                                    Text('Temperature', style: TextStyle(fontSize: 20))
                                                  ],
                                                ),
                                                Container(
                                                  width: 100,
                                                  height: 100,
                                                  child: Image.asset('images/icons/thermometer.png'),
                                                ),
                                              ],
                                            )
                                        ),
                                      )),
                                ],
                              ),
                            )
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }
                );
              }
          );
        } else {
          return const CircularProgressIndicator();
        }
      }
    );
  }
}

Future<bool> isAdmin() async{
  var readAdmin=await const FlutterSecureStorage().read(key: 'isAdmin');
  return readAdmin=="admin"?true:false;
}

class SocketData {
  String? type;
  String? message;

  SocketData({this.type, this.message});

  SocketData.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['message'] = this.message;
    return data;
  }
}

Future<String> getDashboardNumber() async {
  var token= await const FlutterSecureStorage().read(key: "token");
  var headers = {
    'Authorization': 'Bearer $token'
  };
  var request = http.Request('GET', Uri.parse('http://165.22.55.235:8080/api/v1/dashboard/get_db_card'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var data = await response.stream.bytesToString();
    print(data);
    return data;
  }
  else {
  print(response.reasonPhrase);
  }
  return "";
}
