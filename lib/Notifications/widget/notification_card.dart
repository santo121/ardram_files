import 'package:ardram/global/app_colors.dart';
import 'package:ardram/global/text_styles.dart';
import 'package:flutter/material.dart';
Widget notificationCard(context)=>Container(
   margin:const EdgeInsets.only(left: 20,right: 20,top: 20),
  child:Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
          Container(
        decoration:BoxDecoration(
          color: containerBackground,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2,color: Colors.white)
        ),
       
        padding: const EdgeInsets.only(top: 20,right: 20,bottom: 20,left: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               
                 Text("Debited",style: subHeadLine,)
              ],
            ),
         
      Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
            
                 Text("October 10 2022",style:bodyOne,)
              ],
            ),
          ],
        ),
        
      ),
      Text("October 10 2022",style:bodyOne,)
    ],
  ),
);