import 'package:flutter/material.dart';

import '../Colors/colors.dart';
class MyCustomButton extends StatelessWidget {
  final String title;
  final double width;
 VoidCallback onPress;
   MyCustomButton({super.key, required this.title, required this.width,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width:width,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.Primary,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
