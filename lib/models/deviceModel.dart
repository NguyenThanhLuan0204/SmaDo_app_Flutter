class Device {
  String? name;
  String? address;
  String? hospital;
  bool? isActive;

  Device({this.name, this.address, this.hospital, this.isActive});

  Device.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    hospital=json['hospital'];
    isActive=json['isActive']==1?true:false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    return data;
  }
}