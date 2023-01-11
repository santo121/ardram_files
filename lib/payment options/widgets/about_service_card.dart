import 'package:ardram/global/text_styles.dart';
import 'package:flutter/material.dart';

class AboutArdramCard extends StatelessWidget {
  const AboutArdramCard({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height =MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: width - 40,
      height: 175,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 2),
              spreadRadius: 0,
              blurRadius: 9,
              color: Color(0x1E000000),
            )
          ],
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFFEFEFEF),
          border: Border.all(width: 1, color: Colors.white)),
      child: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only( left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About the services",
                      style: subHeadLine,
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      '''As a reminder, select the time period in which you would like to contribute to the ARDRAM project.You will receive a message at selected time''',
                      style:caption,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
            bottom: -11,
            left: -10,
            child: SizedBox(
                width: width - 23,
                child: Image.asset(
                  "assets/images/card_bar.png",
                  fit: BoxFit.fill,
                )))
      ]),
    );
  }
}
