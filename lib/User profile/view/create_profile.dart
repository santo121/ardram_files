import 'dart:developer';

import 'package:ardram/User%20profile/model/profile_creation_model.dart';
import 'package:ardram/User%20profile/service/profile_createion_service.dart';
import 'package:ardram/User%20profile/view/profile_screen.dart';
import 'package:ardram/global/Button/ardram_button.dart';
import 'package:ardram/global/app_colors.dart';
import 'package:ardram/global/text_styles.dart';
import 'package:flutter/material.dart';

import '../../storage/ardram_local_storage.dart';

class ProfileRegistration extends StatefulWidget {
  const ProfileRegistration({super.key});

  @override
  State<ProfileRegistration> createState() => _ProfileRegistrationState();
}

class _ProfileRegistrationState extends State<ProfileRegistration> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
                left: 20,
                right: 20,
                top: MediaQuery.of(context).size.height / 7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //! create account heading
                createAccountText(),
                const SizedBox(
                  height: 10,
                ),
                //! create account sub-heading

                createAccountSub(),
                //! first name field

                nameTextField().textFieldDecoration(),
                //! phone number field
                phoneField().textFieldDecoration(),
                //! email field
                emailField().textFieldDecoration(),
                bloodGroupField().textFieldDecoration(),
                dateOfBirthField().textFieldDecoration(),
                //! create button
                ArdramButton(
                  context: context,
                  buttonText: 'Create account',
                  onTap: () {
                   
                   log(nameController.text);
                   log(emailController.text);
                   log(phoneController.text);
                   log(bloodGroupController.text);
                   log(addressController.text);
                   String? cId =  ArdramLocalStorage.getCustomerId();
                  ClassCreationModel modelData = ClassCreationModel(address: addressController.text,bg: bloodGroupController.text,email: emailController.text,name: nameController.text,phoneNumber: phoneController.text,cId: cId.toString());

                   ProfileCreationService service = ProfileCreationService();
                   service.postProfileService(modelData ).then((value) {
                    value.statusCode==null?
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileScreen()),
                      ):null;
                      ArdramLocalStorage.setUserName(nameController.text);
                      ArdramLocalStorage.setUserPhone(phoneController.text);
                   });
                      
                    
                  },
                ),
                //! login button
                // loginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }



  TextFormField emailField() {
    return TextFormField(
      onChanged: (val) {},
      validator: (String? val) {
        if (val == null || val.length < 4) {
          return 'Name length need to be 4';
        }
        return null;
      },
      keyboardType: TextInputType.name,
      controller: emailController,
      cursorColor: textColor,
      style: caption,
      decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusColor: textColor,
          fillColor: textColor,
          hintText: "E-mail"),
    );
  }

  TextFormField bloodGroupField() {
    return TextFormField(
      onChanged: (val) {},
      validator: (String? val) {
        if (val == null || val.length < 4) {
          return 'Name length need to be 4';
        }
        return null;
      },
      keyboardType: TextInputType.name,
      controller: bloodGroupController,
      cursorColor: textColor,
      style: caption,
      decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusColor: textColor,
          fillColor: textColor,
          hintText: "Blood group"),
    );
  }

  TextFormField dateOfBirthField() {
    return TextFormField(
      onChanged: (val) {},
      validator: (String? val) {
        if (val == null || val.length < 4) {
          return 'Name length need to be 4';
        }
        return null;
      },
      keyboardType: TextInputType.name,
      controller: addressController,
      cursorColor: textColor,
      style: caption,
      decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusColor: textColor,
          fillColor: textColor,
          hintText: "Address"),
    );
  }

  TextFormField phoneField() {
    return TextFormField(
      onChanged: (val) {},
      validator: (String? val) {
        if (val == null || val.length < 4) {
          return 'Name length need to be 4';
        }
        return null;
      },
      keyboardType: TextInputType.number,
      controller: phoneController,
      
      cursorColor: textColor,
      style: caption,
      decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusColor: textColor,
          fillColor: textColor,
          hintText: "Phone Number"),
    );
  }

  TextFormField nameTextField() {
    return TextFormField(
      onChanged: (val) {},
      validator: (String? val) {
        if (val == null || val.length < 4) {
          return 'Name length need to be 4';
        }
        return null;
      },
      keyboardType: TextInputType.name,
      controller: nameController,
      cursorColor: textColor,
      style: caption,
      decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusColor: textColor,
          fillColor: textColor,
          hintText: "Enter Name"),
    );
  }

  Text createAccountSub() {
    return Text(
      "Enter the details to create the account",
      style: bodyOne,
    );
  }

  Text createAccountText() {
    return Text(
      "Create Account",
      style: headLine,
    );
  }
}

extension CustomExtension on Widget {
  Widget textFieldDecoration() => Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 24),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFF8F8F8)),
        child: this,
      );
}
