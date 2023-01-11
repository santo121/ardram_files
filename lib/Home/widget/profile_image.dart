import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, this.imageLink,required this.onTap});
  final String? imageLink;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      width: 120,
      height: 120,
      clipBehavior: Clip.antiAlias,
      decoration:const BoxDecoration(
      shape: BoxShape.circle,
      ),
      child:imageLink==null? const Icon(Icons.manage_accounts_rounded,color: Colors.black,):Image.network(
      'https://picsum.photos/seed/946/600',
      ),
    ),
    );
  }
}