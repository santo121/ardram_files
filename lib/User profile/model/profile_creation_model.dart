class ClassCreationModel {
  String name;
  String phoneNumber;
  String email;
  String bg;
  String address;
  String cId;
  ClassCreationModel(
      {required this.address,
      required this.bg,
      required this.email,
      required this.name,
      required this.phoneNumber,
      required this.cId});

  Map<String, String> toJson() {
    return {
      'address': address,
      'first_name': name,
      'email': email,
      'blood_group': bg,
      'phone': phoneNumber,
      'c_id': cId
    };
  }
}

class ClassCreationResponse {
  bool? status;
  String? message;
  bool? data;
  String? statusCode;
  ClassCreationResponse({this.status, this.message, this.data});

  ClassCreationResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }
  ClassCreationResponse.statCode(String code){
    statusCode = code;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }
}
