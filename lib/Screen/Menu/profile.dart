import 'package:fit/Screen/Login/Screens/Welcome/welcome_screen.dart';
import 'package:fit/appLanguage/language_button.dart';
import 'package:fit/darkmode/dart_mode_button.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProfilePage extends StatefulWidget {

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String value = "7500";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const <Widget>[
                Icon(Icons.settings),
                SizedBox(width: 15.0),
                CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage('images/images.png'),
                )
              ],
            ),
          ),
          Row(children: <Widget>[
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 40.0,
                  ),
                ))
          ]),
          const Mode_Dark_Button(),
          LanguageButton(),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return WelcomeScreen();
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(

                  backgroundColor: Color(0xFF5E135E),
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.exit_to_app),
                  SizedBox(width: 20.0),
                  Text("Log Out"),
                ],
              ),
            ),
          )

        ]),
      ),

    );
  }
}

class FloatingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint yellowcolor = Paint()
      ..color = Colors.amber
      ..strokeWidth = 5;
    Paint greencolor = Paint()
      ..color = Color(0xFF5E135E)
      ..strokeWidth = 5;
    Paint redcolor = Paint()
      ..color = Colors.red
      ..strokeWidth = 5;
    Paint bluecolor = Paint()
      ..color = Color(0xFF5E135E)
      ..strokeWidth = 5;

    canvas.drawLine(Offset(size.width * 0.27, size.height * 0.5),
        Offset(size.width * 0.5, size.height * 0.5), yellowcolor);

    canvas.drawLine(
        Offset(size.width * 0.5, size.height * 0.5),
        Offset(size.width * 0.5, size.height - (size.height * 0.27)),
        greencolor);

    canvas.drawLine(
        Offset(size.width * 0.5, size.height * 0.5),
        Offset(size.width-(size.width * 0.27), size.height*0.5),
        bluecolor);

    canvas.drawLine(
        Offset(size.width * 0.5, size.height * 0.5),
        Offset(size.width*0.5, size.height*0.27),
        redcolor);


  }

  @override
  bool shouldRepaint(FloatingPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(FloatingPainter oldDelegate) => false;
}