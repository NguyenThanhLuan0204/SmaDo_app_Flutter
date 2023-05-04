import 'package:fit/models/PatientTreatedModel.dart';

Future<List<PatientTreated>> getPatientTreatedList() async {
  var result = [
    {
      "name": "Nguyễn Thành Luân",
      "age":17,
      "email":"nguyenthanhluantqd@gmail.com",
      "phone":"0123456789",
      "CCCD":"214545674",
    },
  ];
  List<PatientTreated> patientTreateds = [];
  for (var patientTreated in result) {
    patientTreateds.add(PatientTreated.fromJson(patientTreated));
  }
  return patientTreateds;
}