import 'package:ardram/global/app_colors.dart';
import 'package:ardram/global/size_data.dart';
import 'package:ardram/global/text_styles.dart';
import 'package:flutter/material.dart';

Widget paymentMSGWidget(context)=>Container(
  decoration:BoxDecoration(
    color: containerBackground,
    borderRadius: BorderRadius.circular(20),
    border: Border.all(width: 2,color: Colors.white)
  ),
  margin:const EdgeInsets.only(left: 20,right: 20,top: 20),
  padding: const EdgeInsets.only(top: 20,right: 20,bottom: 20,left: 20),
  child: Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.check_circle,color: ardramTextColor,),
          width10,
           Text("Debited",style: subHeadLine,)
        ],
      ),
        space20,
Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("500",style:mainHeading,),
          width10,
           Text("October 10 2022",style:bodyOne,)
        ],
      ),
    ],
  ),
);