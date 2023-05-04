import 'package:fit/models/hospitalModel.dart';

Future<List<Hospital>> getHospitalList() async {
  var result = [
    {
      "name": "Bệnh viện 30 tháng 4",
      "address": "9 sư vạn hạnh phường 9, Quận 5, Thành Phố Hồ Chí Minh"
    },
    {
      'name': 'Bệnh viện An Bình',
      'address': '9 sư vạn hạnh phường 9, Quận 5, Thành Phố Hồ Chí Minh'
    },
    {
      'name': 'Bệnh viện Bình Dân',
      'address': '9 sư vạn hạnh phường 9, Quận 5, Thành Phố Hồ Chí Minh'
    },
    {
      'name': 'Bệnh viện Bưu Điện 2',
      'address': '9 sư vạn hạnh phường 9, Quận 5, Thành Phố Hồ Chí Minh'
    },
    {
      'name': 'Bệnh viện Đa khoa hoàn mĩ',
      'address': '9 sư vạn hạnh phường 9, Quận 5, Thành Phố Hồ Chí Minh'
    },
    {
      'name': 'Bệnh viện Đa Khoa Sài Gòn',
      'address': '9 sư vạn hạnh phường 9, Quận 5, Thành Phố Hồ Chí Minh'
    },
    {
      'name': 'Bệnh viện tư nhân An Sinh',
      'address': '9 sư vạn hạnh phường 9, Quận 5, Thành Phố Hồ Chí Minh'
    },
    {
      'name': 'Bệnh viện Chợ Rẫy',
      'address': '9 sư vạn hạnh phường 9, Quận 5, Thành Phố Hồ Chí Minh'
    },
    {
      'name': 'Bệnh viện Chấn Thương chỉnh hình',
      'address': '9 sư vạn hạnh phường 9, Quận 5, Thành Phố Hồ Chí Minh'
    },
    {
      'name': 'Bệnh viện 30 tháng 4',
      'address': '9 sư vạn hạnh phường 9, Quận 5, Thành Phố Hồ Chí Minh'
    },
    {
      "name": "Bệnh viện 30 tháng 4",
      "address": "9 sư vạn hạnh phường 9, Quận 5, Thành Phố Hồ Chí Minh"
    },
    {
      'name': 'Bệnh viện An Bình',
      'address': '9 sư vạn hạnh phường 9, Quận 5, Thành Phố Hồ Chí Minh'
    },
    {
      'name': 'Bệnh viện Bình Dân',
      'address': '9 sư vạn hạnh phường 9, Quận 5, Thành Phố Hồ Chí Minh'
    },
    {
      'name': 'Bệnh viện Bưu Điện 2',
      'address': '9 sư vạn hạnh phường 9, Quận 5, Thành Phố Hồ Chí Minh'
    },
    {
      'name': 'Bệnh viện Đa khoa hoàn mĩ',
      'address': '9 sư vạn hạnh phường 9, Quận 5, Thành Phố Hồ Chí Minh'
    },
    {
      'name': 'Bệnh viện Đa Khoa Sài Gòn',
      'address': '9 sư vạn hạnh phường 9, Quận 5, Thành Phố Hồ Chí Minh'
    },
    {
      'name': 'Bệnh viện tư nhân An Sinh',
      'address': '9 sư vạn hạnh phường 9, Quận 5, Thành Phố Hồ Chí Minh'
    },
    {
      'name': 'Bệnh viện Chợ Rẫy',
      'address': '9 sư vạn hạnh phường 9, Quận 5, Thành Phố Hồ Chí Minh'
    },
    {
      'name': 'Bệnh viện Chấn Thương chỉnh hình',
      'address': '9 sư vạn hạnh phường 9, Quận 5, Thành Phố Hồ Chí Minh'
    },
    {
      'name': 'Bệnh viện 30 tháng 4',
      'address': '9 sư vạn hạnh phường 9, Quận 5, Thành Phố Hồ Chí Minh'
    },
  ];
  List<Hospital> hospitals = [];
  for (var hospital in result) {
    hospitals.add(Hospital.fromJson(hospital));
  }
  return hospitals;
}