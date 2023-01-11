
import 'dart:convert';
import 'dart:developer';

import 'package:ardram/global/urls.dart';
import 'package:http/http.dart' as http;


class OtpVerificationService{

  Future<OtpVerificationResponse> sendPhonNumber(OtpRequest request)async{

    final response = await http.post(Uri.parse(otpLogin),body:request.toJson());

    
    if(json.decode(response.body)['data'] is int){
      log('data from Init');
      return OtpVerificationResponse.fromJsonInit(json.decode(response.body));
      
    }else{
      log('data from second');

      return OtpVerificationResponse.fromJson(json.decode(response.body));
    }
    // log('data ${
    // json.decode(response.body)['status']}');


   
  }
}


class OtpRequest{
  final String phoneNumber;
  final String userName;
  OtpRequest({required this.phoneNumber,required this.userName});

  Map<String,String>toJson(){
    return{'phone':phoneNumber,
            'first_name':userName
    };
  }
}

// {
//     "data": {
//         "c_id": "100",
//         "first_name": "",
//         "last_name": "",
//         "address": "",
//         "pincode": "0",
//         "email": "",
//         "phone": "9544787978",
//         "guardian_name": null,
//         "job": "",
//         "dob": "",
//         "blood_group": null,
//         "gender": "",
//         "password": "d41d8cd98f00b204e9800998ecf8427e",
//         "staff_id": null,
//         "aardram_id": null,
//         "photo": null,
//         "sign": null,
//         "status": "0",
//         "created_by": null,
//         "created_at": "2022-10-29 18:40:46",
//         "modified_by": null,
//         "modified_at": "2022-10-29 18:40:46",
//         "total_amt": "0",
//         "due_date": "2022-10-29",
//         "g_id": ""
//     }
// }



// {
//     "status": true,
//     "message": "The user has been added successfully.",
//     "data": 101
// }



class OtpVerificationResponses {
  bool? status;
  String? message;
  int? data;
  bool?initialData;
  OtpVerificationResponses({this.status, this.message, this.data});

  OtpVerificationResponses.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
    initialData = true;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['data'] = this.data;
    return data;
  }
}



class OtpVerificationResponse {
  Data? data;
  bool? status;
  String? message;
  String? value;
  bool? initialLog;
  OtpVerificationResponse({this.data});

  OtpVerificationResponse.fromJsonInit(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    value = json['data'].toString();
    initialLog = true;
  }

  OtpVerificationResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? cId;
  String? firstName;
  String? lastName;
  String? address;
  String? pincode;
  String? email;
  String? phone;
  String? guardianName;
  String? job;
  String? dob;
  String? bloodGroup;
  String? gender;
  String? password;
  String? staffId;
  String? aardramId;
  String? photo;
  String? sign;
  String? status;
  String? createdBy;
  String? createdAt;
  String? modifiedBy;
  String? modifiedAt;
  String? totalAmt;
  String? dueDate;
  String? gId;

  Data(
      {this.cId,
      this.firstName,
      this.lastName,
      this.address,
      this.pincode,
      this.email,
      this.phone,
      this.guardianName,
      this.job,
      this.dob,
      this.bloodGroup,
      this.gender,
      this.password,
      this.staffId,
      this.aardramId,
      this.photo,
      this.sign,
      this.status,
      this.createdBy,
      this.createdAt,
      this.modifiedBy,
      this.modifiedAt,
      this.totalAmt,
      this.dueDate,
      this.gId});

  Data.fromJson(Map<String, dynamic> json) {
    cId = json['c_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    address = json['address'];
    pincode = json['pincode'];
    email = json['email'];
    phone = json['phone'];
    guardianName = json['guardian_name'];
    job = json['job'];
    dob = json['dob'];
    bloodGroup = json['blood_group'];
    gender = json['gender'];
    password = json['password'];
    staffId = json['staff_id'];
    aardramId = json['aardram_id'];
    photo = json['photo'];
    sign = json['sign'];
    status = json['status'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    modifiedBy = json['modified_by'];
    modifiedAt = json['modified_at'];
    totalAmt = json['total_amt'];
    dueDate = json['due_date'];
    gId = json['g_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['c_id'] = this.cId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['address'] = this.address;
    data['pincode'] = this.pincode;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['guardian_name'] = this.guardianName;
    data['job'] = this.job;
    data['dob'] = this.dob;
    data['blood_group'] = this.bloodGroup;
    data['gender'] = this.gender;
    data['password'] = this.password;
    data['staff_id'] = this.staffId;
    data['aardram_id'] = this.aardramId;
    data['photo'] = this.photo;
    data['sign'] = this.sign;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['modified_by'] = this.modifiedBy;
    data['modified_at'] = this.modifiedAt;
    data['total_amt'] = this.totalAmt;
    data['due_date'] = this.dueDate;
    data['g_id'] = this.gId;
    return data;
  }
}