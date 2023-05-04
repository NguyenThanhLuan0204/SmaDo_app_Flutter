class PatientTreated {
  String? name;
  int? age;
  String? email;
  String? phone;
  String? CCCD;

  PatientTreated({this.name, this.age, this.email,this.phone,this.CCCD});

  PatientTreated.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    email = json['email'];
    phone = json['phone'];
    CCCD = json['CCCD'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['age'] = this.age;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['CCCD'] = this.CCCD;

    return data;
  }
}