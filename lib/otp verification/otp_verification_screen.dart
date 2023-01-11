import 'dart:async';
import 'dart:developer';

import 'package:ardram/Home/view/home_screen.dart';
import 'package:ardram/global/Button/ardram_button.dart';
import 'package:ardram/global/app_colors.dart';
import 'package:ardram/otp%20verification/verifiavction%20service/otp_verification_service.dart';
import 'package:ardram/storage/ardram_local_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final textEditingController = TextEditingController();
  late FocusNode textFieldFocusNode;
  late FocusNode otpFieldFocusNode;
  late StreamController<ErrorAnimationType>? errorController;
  bool circularIndicator = false;
  bool otpFieldVisible = false;
  bool otpFill = false;
  String verificationIdFromFirebase = '';
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    textFieldFocusNode = FocusNode();
    otpFieldFocusNode = FocusNode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                child: Column(
                  children: [
                    TextFormField(
                      autofocus: true,
                      onFieldSubmitted: (_) =>
                          textFieldFocusNode.requestFocus(),
                      controller: nameController,
                      cursorColor: textColor,
                      decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          focusColor: textColor,
                          fillColor: textColor,
                          hintText: "Enter your name"),
                    ).textFieldDecoration(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 3,
                          child: TextFormField(
                            onChanged: (val) {
                              if (val.length == 10) {
                                otpFieldFocusNode.requestFocus();
                              }
                            },
                            focusNode: textFieldFocusNode,
                            //   onFieldSubmitted: (_) =>
                            // otpFieldFocusNode.requestFocus(),
                            keyboardType: TextInputType.number,
                            controller: phoneController,
                            cursorColor: textColor,
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                focusColor: textColor,
                                fillColor: textColor,
                                hintText: "Enter your Number"),
                          ).textFieldDecoration(),
                        ),
                        Flexible(
                          flex: 1,
                          child: Center(
                            child: TextButton(
                                child: Text(
                                  "Sent OTP",
                                  style: TextStyle(color: ardramTextColor),
                                ),
                                onPressed: () {
                                  setState(() {
                                    circularIndicator = true;
                                  });
                                  verifyPhoneNumber();
                                }),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: otpFieldVisible,
                      child: Form(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 30),
                            child: PinCodeTextField(
                                controller: textEditingController,
                                focusNode: otpFieldFocusNode,
                                appContext: context,
                                length: 6,
                                onChanged: (String value) {
                                  if (value.length < 6) {
                                    setState(() {
                                      otpFill = false;
                                    });
                                  }
                                },
                                cursorColor: ardramTextColor,
                                keyboardType: TextInputType.number,
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(5),
                                  fieldHeight: 50,
                                  fieldWidth: 40,
                                  activeFillColor: Colors.white,
                                ),
                                animationDuration:
                                    const Duration(milliseconds: 300),
                                onCompleted: (v) {
                                  log("Completed");
                                  setState(() {
                                    otpFill = true;
                                  });
                                },
                                validator: (v) {
                                  if (v!.length < 4) {
                                    return "Enter correct number";
                                  } else {
                                    return null;
                                  }
                                })),
                      ),
                    ),
                    Visibility(
                      visible: circularIndicator,
                      child: CircularProgressIndicator(
                        color: ardramTextColor,
                      ),
                    )
                  ],
                ),
              ),
              Visibility(
                //!need to uncomment this
                visible: otpFill,
                // visible: true,
                child: SizedBox(
                    child: ArdramButton(
                  context: context,
                  onTap: () {
                    //!nameController validation
                    nameController.text.isEmpty
                        ? ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                            content: Text(
                              "Missing user name",
                              style: TextStyle(color: Colors.red),
                            ),
                          ))
                        : verifyOtpCode();
                  },
                  buttonText: "Verify",
                )),
              )
            ]),
      ),
    );
  }

  void verifyPhoneNumber() {
    auth.verifyPhoneNumber(
      phoneNumber: '+91${phoneController.text}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) async {
          //! login successful navigation

          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (route) => false);
          //! login successful

          final pref = await SharedPreferences.getInstance();
          pref.setBool("isLogin", true);
          log(pref.get('isLogin').toString());
          log("logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException exception) {
        log(exception.message.toString());
        setState(() {
          circularIndicator = false;
        });
      },
      codeSent: (String verificationId, int? resendToken) {
        verificationIdFromFirebase = verificationId;
        setState(() {
          setState(() {
            circularIndicator = false;
          });
          otpFieldVisible = true;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOtpCode() async {
    // todo firebase cred init
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationIdFromFirebase,
        smsCode: textEditingController.text);
    // todo firebase auth

    await auth.signInWithCredential(credential).then((value) async {

    // todo : adding verified data to database

      OtpVerificationService service = OtpVerificationService();
      OtpRequest request = OtpRequest(
          phoneNumber: phoneController.text,
          userName: nameController.text);
      service.sendPhonNumber(request).then((value) {
        // log('data form button ${value.value.toString()}');

        value.value != null
            ? log(value.value.toString())
            : log(value.data!.cId.toString());
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false);

        ArdramLocalStorage.setCustomerId(value.value != null
            ? value.value.toString()
            : value.data!.cId.toString());
            ArdramLocalStorage.setUserName(nameController.text);
            ArdramLocalStorage.setUserPhone(phoneController.text);
      });

      final pref = await SharedPreferences.getInstance();
      pref.setBool("isLogin", true);
      log("logged in successfully");
    });
  }
}

extension CustomExtension on Widget {
  Widget textFieldDecoration() => Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.white),
            borderRadius: BorderRadius.circular(20),
            color: containerBackground),
        child: this,
      );
}
