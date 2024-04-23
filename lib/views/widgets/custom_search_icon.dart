import 'package:flutter/material.dart';

class CustomAppBarIcon extends StatelessWidget {
  final IconData icon;
  void Function()? onPressed;

   CustomAppBarIcon({super.key, required this.icon,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.05),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
          child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
        iconSize: 20,
      )),
    );
  }
}
