import 'package:fit/models/deviceModel.dart';

Future<List<Device>> getDeviceList() async {
  var result = [
    {
      "name": "HBeat-MH371",
      "address":"DB-BA-CB-13-HG-31",
      "hospital":"BV Hoan My",
      "isActive":0
    },
    {
      "name": "HBeat-MH372",
      "address": "DB-BA-CB-13-HG-32",
      "hospital":"BV Hoan My",
      "isActive":1
    },
    {
      "name": "HBeat-MH373",
      "address": "DB-BA-CB-13-HG-33",
      "hospital":"BV Hoan My",
      "isActive":1
    },
    {
      "name": "HBeat-MH374",
      "address": "DB-BA-CB-13-HG-34",
      "hospital":"BV Hoan My",
      "isActive":0
    },
    {
      "name": "HBeat-MH375",
      "address": "DB-BA-CB-13-HG-35",
      "hospital":"BV Hoan My",
      "isActive":1
    },
    {
      "name": "HBeat-MH376",
      "address": "DB-BA-CB-13-HG-36",
      "hospital":"BV Hoan My",
      "isActive":0
    },
    {
      "name": "HBeat-MH377",
      "address": "DB-BA-CB-13-HG-37",
      "hospital":"BV Hoan My",
      "isActive":0
    },
    {
      "name": "HBeat-MH378",
      "address": "DB-BA-CB-13-HG-38",
      "hospital":"BV Hoan My",
      "isActive":1
    },
    {
      "name": "HBeat-MH379",
      "address": "DB-BA-CB-13-HG-39",
      "hospital":"BV Hoan My",
      "isActive":0
    },
  ];
  List<Device> devices = [];
  for (var device in result) {
    devices.add(Device.fromJson(device));
  }
  return devices;
}