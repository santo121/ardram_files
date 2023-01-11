import 'dart:developer';

import 'package:ardram/Home/widget/app_carousel.dart';
import 'package:ardram/Home/widget/ardram_card.dart';
import 'package:ardram/Home/widget/methord_cards.dart';
import 'package:ardram/Home/widget/profile_image.dart';
import 'package:ardram/Notifications/controller/notification_controller.dart';
import 'package:ardram/Notifications/view/notification_screen.dart';
import 'package:ardram/User%20profile/view/profile_screen.dart';
import 'package:ardram/global/app_colors.dart';
import 'package:ardram/global/text_styles.dart';
import 'package:ardram/payment%20history/view/payment_history.dart';
import 'package:ardram/payment%20options/view/payment_option.dart';
import 'package:ardram/storage/ardram_local_storage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


@override
  void initState() {
    super.initState();
    listenNotification();
        log('data form button ${ArdramLocalStorage.getCustomerId()}');
    
  }

void listenNotification()=>NotificationController.onNotifications.stream.listen(onClickNotification);

void onClickNotification(dynamic value)=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PaymentMethods(userSelectedPeriod: value,)));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: ProfileImage(onTap: () {
 Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()),
                );

        }),
        title: const Text(
          "Ardram",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationScreen()),
                );
              },
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const AppCarousel(
            initialCount: 1,
          ),
          const ArdramCard(),
          textHead(),
          MethodCards(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PaymentMethods()),
                );
              },
              icons: Icons.wifi,
              option: "Online Payment"),
          MethodCards(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PaymentHistory()),
                );
              }, icons: Icons.history, option: "Payment History"),
          MethodCards(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PaymentMethods(
                            forOnlinePayment: false,
                          )),
                );
              },
              icons: Icons.edit,
              option: "Edit payment Method"),
        ]),
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:const StadiumBorder(),
          backgroundColor: ardramTextColor),
        onPressed: () { 
         _launchInBrowser(Uri.parse('https://ardram.org'));
},
        
      child: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width/4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:const [ Text("About us"),Icon(Icons.web_sharp),],)),)
    );
  }

  Container textHead() {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 20),
      child: Row(
        children: [
          Text(
            "Payment methods",
            style: caption,
          ),
        ],
      ),
    );
  }
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}
