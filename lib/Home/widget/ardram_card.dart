

import 'package:ardram/global/app_colors.dart';
import 'package:ardram/global/text_styles.dart';
import 'package:flutter/material.dart';
class ArdramCard extends StatelessWidget {
  const ArdramCard({super.key});

  @override
  Widget build(BuildContext context) {
     double width =MediaQuery.of(context).size.width;
    // double height =MediaQuery.of(context).size.height;
    return Container(
      margin:const EdgeInsets.only(top: 20),
      width:width-40,
      height: 175,
      decoration: BoxDecoration(
       
        boxShadow: const[
          BoxShadow(
        offset: Offset(0, 2),
        spreadRadius: 0,
        blurRadius: 9,
        color: Color(0x1E000000),
    )
        ],
        borderRadius: BorderRadius.circular(20),
        color:containerBackground,
        border: Border.all(width: 1,color: Colors.white)
      ),
      
      
    child: Stack(children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin:const EdgeInsets.only(top: 20,left: 20,right: 20),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text("Ardram Card",style: ardramText,),
                Image.asset('assets/images/payment.png')
              ],
            ),
          ),
          Container(
            margin:const EdgeInsets.only(bottom: 40,left: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text("2000",style: headLine,),
                    const SizedBox(height: 5,),
                    const Text("Ardram Card"),

                  ],
                ),
                 const Text("Thomas PK"),
                
              ],
            ),
          )
          
        ],
      ),
      Positioned(
        bottom: -11,
        left: -10,
        child: SizedBox(
          width: width-23,
          child: Image.asset("assets/images/card_bar.png",fit: BoxFit.fill,)))
    ]),
    );
  }
}