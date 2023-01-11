import 'dart:convert';

import 'package:ardram/User%20profile/model/profile_creation_model.dart';
import 'package:ardram/global/urls.dart';
import 'package:http/http.dart' as http;
class ProfileCreationService{
  Future<ClassCreationResponse> postProfileService (ClassCreationModel  model)async{

    final response = await http.post(Uri.parse(profileCreation),body: model.toJson());

    if(response.statusCode==200){
      return ClassCreationResponse.fromJson(json.decode(response.body));

    }
    else{
      return ClassCreationResponse.statCode(response.statusCode.toString());
    }


  }
}