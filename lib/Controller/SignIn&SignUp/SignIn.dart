import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
Future<bool> SignIn(String username, String password) async{
  var headers = {
    'Content-Type': 'application/json'
  };
  var request = http.Request('POST', Uri.parse('http://165.22.55.235:8080/api/v1/user/signin'));
  request.body = json.encode({
    "username": username,
    "password": password
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  var data= jsonDecode(await response.stream.bytesToString());
  print('login data nè: '+ data.toString());
  if (response.statusCode == 201) {
    if(data['status']=='400'){
      print('sai Account');
      return true;
    }else
    {
      var isAdmin= data["isAdmin"].toString()=="true"?"admin":"user";
      await FlutterSecureStorage()
          .write(key: "isAdmin", value: isAdmin);
      await FlutterSecureStorage()
          .write(key: "token", value: data["token"]);
      return true;
    }
  }
  return false;
}