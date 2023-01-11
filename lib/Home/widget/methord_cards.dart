import 'package:ardram/global/text_styles.dart';
import 'package:flutter/material.dart';

class MethodCards extends StatelessWidget {
  const MethodCards({super.key,required this.onTap,required this.icons,required this.option,this.onLongTap});

final void Function() onTap;
final void Function()? onLongTap;

final String option;
final IconData icons;
  @override
  Widget build(BuildContext context) {
    return
    GestureDetector(
      onTap: onTap,
      onLongPress: onLongTap,
      child: Container(
      width: MediaQuery.of(context).size.width,
      margin:const EdgeInsets.only(left: 20,right: 20,top: 20),
      height: 70,
      decoration: BoxDecoration(
      color:const Color(0xFFECECEC),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: Colors.white,
        width: 1
      ),
      ),
      child:Row(
      mainAxisSize: MainAxisSize.max,
      children: [
      const SizedBox(width: 20,),
      Icon(
        icons,
        color: Colors.black,
        size: 24,
      ),
      const SizedBox(width: 20,),
    
      Text(
        option,style: bodyOne,
        
      ),
      ],
    )
    ),
    );
    
    
    
     

  }
}