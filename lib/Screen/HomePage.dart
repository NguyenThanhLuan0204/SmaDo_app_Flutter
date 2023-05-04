import 'package:fit/Screen/Menu/Analytics.dart';
import 'package:fit/Screen/Menu/NotificationManagerScreen.dart';
import 'package:fit/Screen/Menu/dashboard.dart';
import 'package:fit/Screen/Menu/device.dart';
import 'package:fit/Screen/Menu/doctor.dart';
import 'package:fit/Screen/Menu/temperature.dart';
import 'package:fit/Screen/Menu/SPO2.dart';
import 'package:fit/Screen/Menu/heartbeat.dart';
import 'package:fit/Screen/Menu/patients_treated.dart';
import 'package:flutter/material.dart';

import 'Menu/hospital.dart';
import 'Menu/profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

final kTitleTextStyle = TextStyle(
  fontSize: (10 * 1.7),
  fontWeight: FontWeight.w600,
);
final kCaptionTextStyle = TextStyle(
  fontSize: (10 * 1.3),
  fontWeight: FontWeight.w100,
);

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String _title = 'Dashboard';
  Widget _body = Dashboard();
  void _handleMenuItemSelected(String title, Widget body) {
    Navigator.pop(context);
    setState(() {
      _title = title;
      _body = body;
    });
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: isAdmin(),
      builder: (context,snapshot) {
        if(snapshot.hasData){
          bool isAdmin=snapshot.data!;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor:Color(0xFF5E135E),
              title: Text(_title),
            ),
            drawer: Drawer(
              backgroundColor:Colors.white,
              child: ListView(
                children: [
                  SizedBox(
                    height: 250.0,
                    child: DrawerHeader(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 10 * 10,
                            width: 10 * 10,
                            margin: EdgeInsets.only(top: 10 * 3),
                            child: Stack(
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 10 * 5,
                                  backgroundImage: AssetImage('images/images.png'),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    height: 10 * 2.5,
                                    width: 10 * 2.5,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).backgroundColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      heightFactor: 10 * 1.5,
                                      widthFactor: 10 * 1.5,
                                      child: Icon(
                                        Icons.edit,
                                        color: Color(0xFF5E135E),
                                        size: (10 * 1.5),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10 * 2),
                          // Text(
                          //   'Nguyễn Thành Luân',
                          //   style: kTitleTextStyle,
                          // ),
                          // SizedBox(height: 10 * 0.5),
                          // Text(
                          //   'nguyenthanhluan@gmail.com',
                          //   style: kCaptionTextStyle,
                          // ),
                          SizedBox(height: 10 * 0.5),
                          isAdmin? Text(
                            'Admin',
                            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                          ): Text(
                            'User',
                            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Dashboard
                  Container(
                    decoration: BoxDecoration(
                      color: _selectedIndex==0 ? Color(0xFF5E135E) : Colors.white, // set the color of the Container to red
                    ),
                    child: ListTile(
                      title: Text(
                        'Dashboard',
                        style: TextStyle(
                            color: _selectedIndex!=0 ? Color(0xFF5E135E) : Colors.white // set the color of the Container to red
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _selectedIndex = 0;
                        });
                        _handleMenuItemSelected('Dashboard', Dashboard());
                      },
                    ),
                  ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: _selectedIndex==1 ? Color(0xFF5E135E) : Colors.white, // set the color of the Container to red
                  //   ),
                  //   child: ListTile(
                  //     title: const Text('Quản Lý Bác Sĩ'),
                  //     onTap: () {
                  //       setState(() {
                  //         _selectedIndex = 1;
                  //       });
                  //       _handleMenuItemSelected('Quản Lý Bác Sĩ', DoctorPage());
                  //     },
                  //     selectedColor: Colors.red,
                  //   ),
                  // ),
                 isAdmin? Container(
                    decoration: BoxDecoration(
                      color: _selectedIndex==2 ? Color(0xFF5E135E) : Colors.white, // set the color of the Container to red
                    ),
                    child: ListTile(
                      title:  Text('Patients Manager',style: TextStyle(
                          color: _selectedIndex!=2 ? Color(0xFF5E135E) : Colors.white // set the color of the Container to red
                      ),),
                      onTap: () {
                        setState(() {
                          _selectedIndex = 2;
                        });
                        _handleMenuItemSelected('Patients Manager', Patient_treated());
                      },
                      selectedColor: Colors.red,
                    ),
                  ):Container(),
                  isAdmin?Container(
                    decoration: BoxDecoration(
                      color: _selectedIndex==3 ? Color(0xFF5E135E) : Colors.white, // set the color of the Container to red
                    ),
                    child: ListTile(
                      title: Text('Devices Manager',style: TextStyle(
                          color: _selectedIndex!=3 ? Color(0xFF5E135E) : Colors.white // set the color of the Container to red
                      ),),
                      onTap: () {
                        setState(() {
                          _selectedIndex = 3;
                        });
                        _handleMenuItemSelected('Devices Manager', Device());
                      },
                      selectedColor: Colors.red,
                    ),
                  ):Container(),
                  !isAdmin?Container(
                    decoration: BoxDecoration(
                      color: _selectedIndex==4 ? Color(0xFF5E135E) : Colors.white, // set the color of the Container to red
                    ),
                    child: ListTile(
                      title: Text('Hearthbeat',style: TextStyle(
                          color: _selectedIndex!=4 ? Color(0xFF5E135E) : Colors.white // set the color of the Container to red
                      ),),
                      onTap: () {
                        setState(() {
                          _selectedIndex = 4;
                        });
                        _handleMenuItemSelected('Hearthbeat', HeartBeat());
                      },
                      selectedColor: Colors.red,
                    ),
                  ):Container(),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: _selectedIndex==5 ? Color(0xFF5E135E) : Colors.white, // set the color of the Container to red
                  //   ),
                  //   child: ListTile(
                  //     title: const Text('Quản lý Tập Luật Y Tế'),
                  //     onTap: () {
                  //       setState(() {
                  //         _selectedIndex = 5;
                  //       });
                  //       _handleMenuItemSelected(
                  //           'Quản lý Tập Luật Y Tế', medicalLawbook());
                  //     },
                  //     selectedColor: Colors.red,
                  //   ),
                  // ),
                  isAdmin?Container(
                    decoration: BoxDecoration(
                      color: _selectedIndex==6 ? Color(0xFF5E135E) : Colors.white, // set the color of the Container to red
                    ),
                    child: ListTile(
                      title:  Text('Hospital Manager',style: TextStyle(
                          color: _selectedIndex!=6 ? Color(0xFF5E135E) : Colors.white // set the color of the Container to red
                      ),),
                      onTap: () {
                        setState(() {
                          _selectedIndex = 6;
                        });
                        _handleMenuItemSelected('Hospital Manager', HospitalPage());
                      },
                      selectedColor: Colors.red,
                    ),
                  ):Container(),
                 !isAdmin? Container(
                    decoration: BoxDecoration(
                      color: _selectedIndex==7 ? Color(0xFF5E135E) : Colors.white, // set the color of the Container to red
                    ),
                    child: ListTile(
                      title:  Text('SPO2',style: TextStyle(
                          color: _selectedIndex!=7 ? Color(0xFF5E135E) : Colors.white // set the color of the Container to red
                      ),),
                      onTap: () {
                        setState(() {
                          _selectedIndex = 7;
                        });
                        _handleMenuItemSelected('SPO2', SPO2());
                      },
                      selectedColor: Colors.red,
                    ),
                  ):Container(),
                  !isAdmin?Container(
                    decoration: BoxDecoration(
                      color: _selectedIndex==8 ? Color(0xFF5E135E) : Colors.white, // set the color of the Container to red
                    ),
                    child: ListTile(
                      title:  Text('Temperature',style: TextStyle(
                          color: _selectedIndex!=8 ? Color(0xFF5E135E) : Colors.white // set the color of the Container to red
                      ),),
                      onTap: () {
                        setState(() {
                          _selectedIndex = 8;
                        });
                        _handleMenuItemSelected('Temperature', Temprature());
                      },
                      selectedColor: Colors.red,
                    ),
                  ):Container(),
                  !isAdmin?Container(
                    decoration: BoxDecoration(
                      color: _selectedIndex==9 ? Color(0xFF5E135E) : Colors.white, // set the color of the Container to red
                    ),
                    child: ListTile(
                      title: const Text('Analytics'),
                      onTap: () {
                        setState(() {
                          _selectedIndex = 9;
                        });
                        _handleMenuItemSelected('Analytics', Analytics());
                      },
                      selectedColor: Colors.red,
                    ),
                  ):Container(),
                  !isAdmin?Container(
                    decoration: BoxDecoration(
                      color: _selectedIndex==6 ? Color(0xFF5E135E) : Colors.white, // set the color of the Container to red
                    ),
                    child: ListTile(
                      title:  Text('Hospital Manager',style: TextStyle(
                          color: _selectedIndex!=6 ? Color(0xFF5E135E) : Colors.white // set the color of the Container to red
                      ),),
                      onTap: () {
                        setState(() {
                          _selectedIndex = 6;
                        });
                        _handleMenuItemSelected('Hospital Manager', HospitalPage());
                      },
                      selectedColor: Colors.red,
                    ),
                  ):Container(),
                  Container(
                    decoration: BoxDecoration(
                      color: _selectedIndex==10 ? Color(0xFF5E135E) : Colors.white, // set the color of the Container to red
                    ),
                    child: ListTile(
                      title:  Text('Account',style: TextStyle(
                          color: _selectedIndex!=10 ? Color(0xFF5E135E) : Colors.white // set the color of the Container to red
                      ),),
                      onTap: () {
                        setState(() {
                          _selectedIndex = 10;
                        });
                        _handleMenuItemSelected('Account', ProfilePage());
                      },
                      selectedColor: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            body: _body,
          );
        }else return CircularProgressIndicator();
      }
    );
  }
}
