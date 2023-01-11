import 'package:ardram/Home/widget/methord_cards.dart';
import 'package:ardram/Notifications/view/notification_screen.dart';
import 'package:ardram/User%20profile/view/create_profile.dart';
import 'package:ardram/global/size_data.dart';
import 'package:ardram/global/text_styles.dart';
import 'package:ardram/splash%20screen/splashscreen.dart';
import 'package:ardram/storage/ardram_local_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool imageLink = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Profile",
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
      body: SizedBox(
        width: width(context),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: 180,
                  height: 180,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: imageLink
                      ? const Icon(
                          Icons.manage_accounts_rounded,
                          color: Colors.black,
                        )
                      : Image.network(
                          'https://picsum.photos/seed/946/600',
                        ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child:Container(
                    decoration:const BoxDecoration(color: Colors.white,shape:BoxShape.circle ),
                    child: IconButton(onPressed: (){}, icon: const Icon(Icons.edit))) 
                  )
              ],
            ),
            space20,
          Text(ArdramLocalStorage.getUserName().toString(),style: headLine,),
          space10,
          Text(ArdramLocalStorage.getUserPhone().toString(),style:bodyOne,),
            MethodCards(
              onTap: () async{

                Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const ProfileRegistration()));
                
              }, icons: Icons.person_add_alt_sharp, option: "Add personal details"),
           MethodCards(
            onTap: (){},
              onLongTap: ()async{

                Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const SplashScreen()));
                 await ArdramLocalStorage.setLoggedIn(false);
              }, icons: Icons.logout, option: "Logout"),

              

         
          ],
        ),
      ),
    );
  }
}
