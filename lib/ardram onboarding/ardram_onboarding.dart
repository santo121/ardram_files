
import 'package:ardram/global/app_colors.dart';
import 'package:ardram/otp%20verification/otp_verification_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class ArdramOnboarding extends StatefulWidget {
  const ArdramOnboarding({super.key});

  @override
  _ArdramOnboardingState createState() => _ArdramOnboardingState();
}

class _ArdramOnboardingState extends State<ArdramOnboarding> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) =>const OtpVerification()),
    );
  }


  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

     final pageDecoration =  PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700,color: ardramTextColor),
      bodyTextStyle: bodyStyle,
      bodyPadding:const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalHeader:const Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 16, right: 16),
            // child: _buildImage('flutter.png', 100),
          ),
        ),
      ),
      globalFooter: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          child: Text(
            'Let\'s go right away!',
            style:const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,),
          ),
          onPressed: () => _onIntroEnd(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: ardramTextColor
          ),
        ),
      ),
      pages: [
        PageViewModel(
          title: "അവശതയിൽ ആർദ്ര സ്പർശം ",
          body:
          "നമ്മുടെ ചുറ്റുമുള്ള ആയിരകണക്കിന് രോഗികളിൽ പലരും വേണ്ടത്ര പണമില്ലാത്തതിനാൽ മരുന്ന് കഴിക്കാത്തവരും മരുന്നിനുവേണ്ടി കഷ്ടപെടുന്നവരുമാണ് എന്ന് നമുക്കറിയാം. മരണം അകാലത്തിൽ നിശബ്ദമായി അരികിലെത്തുമ്പോൾ അതിനെ തടുത്തുനിർത്തുവാനോ വേദനക്ക് കുറവുവരുത്തുവാനോ മരുന്നിനു പണമില്ലെന്ന അവസ്ഥ എത്രയോ ഹൃദയഭേദകം . സഹനങ്ങളുടെ ആ ജീവിതങ്ങളെ തൊട്ടറിഞ്ഞു അവർക്കുമുന്നിൽ ഒരു ആർദ്ര സാന്ത്വനത്തിന്റെ തണൽ പൊഴിക്കുവാൻ നമുക്കേവർക്കും ബാധ്യതയുണ്ട് എന്ന് ഞങ്ങൾ കരുതുന്നു. ഈ ബാധ്യത നിറവേറ്റുന്നതിലേക്കായി ഞങ്ങൾ അഭിമാനപുരസ്സരം ആരംഭിക്കുന്ന സ്വപ്ന പദ്ധതിയാണ് ആർദ്രം.",
          // image: _buildImage('img1.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "അവശതയിൽ ആർദ്ര സ്പർശം",
          body:
          "ഇരിഞ്ഞാലക്കുട സോഷ്യൽ വെൽഫയർ കോ-ഓപ്പറേറ്റീവ് സൊസൈറ്റിയുടെയും ദയ ചാരിറ്റബ്ള് ട്രസ്റ്റിൻെറയും സംയുക്ത സ്ഥാപനം",

          // image: _buildFullscreenImage(),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 2,
            imageFlex: 3,
          ),
        ),
       
       
        PageViewModel(
          title: "രോഗാതുരതയിൽ ഒരാർദ്ര സാന്ത്വനം ",
          body:'ഇരിങ്ങാലക്കുട സോഷ്യൽ വെൽഫയർ കോ-ഓപ്പറേറ്റീവ് സൊസൈറ്റിയുടെയും ദയ ചാരിറ്റബ്ള് ട്രസ്റ്റിൻെറയും സംയുക്ത സ്ഥാപനം. ',
          // image: _buildFullscreenImage(),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 2,
            imageFlex: 3,
          ),
        ),
        // PageViewModel(
        //   title: "Another title page",
        //   body: "Another beautiful body text for this example onboarding",
        //   // image: _buildImage('img2.jpg'),
        //   footer: ElevatedButton(
        //     onPressed: () {
        //       introKey.currentState?.animateScroll(0);
        //     },
        //     child: const Text(
        //       'FooButton',
        //       style: TextStyle(color: Colors.white),
        //     ),
        //     style: ElevatedButton.styleFrom(
        //       backgroundColor: ardramTextColor,
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(8.0),
        //       ),
        //     ),
        //   ),
        //   decoration: pageDecoration,
        // ),
        PageViewModel(
          title: "നിർധനരായ രോഗികൾക്ക് സൗജന്യമായി മരുന്ന് നൽകുന്ന കാരുണ്യ പദ്ധതി",
          bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
             
            ],
          ),
          decoration: pageDecoration.copyWith(
            bodyFlex: 2,
            imageFlex: 4,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.topCenter,
          ),
          // image: _buildImage('img1.jpg'),
          reverse: true,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        // color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text("This is the screen after Introduction")),
    );
  }
}
