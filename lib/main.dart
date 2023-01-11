import 'package:ardram/Home/controller/home_controller.dart';
import 'package:ardram/Home/view/home_screen.dart';
import 'package:ardram/Notifications/view/notification_screen.dart';
import 'package:ardram/ardram%20onboarding/ardram_onboarding.dart';
import 'package:ardram/otp%20verification/otp_verification_screen.dart';
import 'package:ardram/payment%20history/view/payment_history.dart';
import 'package:ardram/payment%20options/controller/payment_option.dart';
import 'package:ardram/payment%20options/view/payment_option.dart';
import 'package:ardram/splash%20screen/splashscreen.dart';
import 'package:ardram/storage/ardram_local_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

 Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await ArdramLocalStorage.initStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // isLogin

final MaterialColor colorCustom =const MaterialColor(0xFF008415,{
50:Color(0xFF008415),
100:Color(0xFF008415),
200:Color(0xFF008415),
300:Color(0xFF008415),
400:Color(0xFF008415),
500:Color(0xFF008415),
600:Color(0xFF008415),
700:Color(0xFF008415),
800:Color(0xFF008415),
900:Color(0xFF008415),
});
  
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeController()),
        ChangeNotifierProvider(create: (_) => PaymentOption()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: colorCustom,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/payment_method': (context) => const PaymentMethods(),
          '/payment_history': (context) => const PaymentHistory(),
          '/notificationScreen': (context) => const NotificationScreen(),
          '/otpVerification': (context) => const OtpVerification(),
          '/home': (context) => const HomeScreen(),
          '/ardramOnboarding': (context) =>const ArdramOnboarding(),
        },
      ),
    );
  }
}
