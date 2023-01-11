import 'package:flutter/material.dart';

class ArdramButton extends StatelessWidget {
  const ArdramButton(
      {Key? key,
      required this.context,
      required this.onTap,
      required this.buttonText})
      : super(key: key);

  final BuildContext context;
  final void Function() onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only( top: 20, bottom: 10,left: 20,right: 20),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        splashColor: const Color(0xFF168628),
        child: Ink(
            decoration: BoxDecoration(
                color: const Color(0xFF004B0C),
                borderRadius: BorderRadius.circular(10)),
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: Center(
                child: Text(
              buttonText,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ))),
      ),
    );
  }
}
