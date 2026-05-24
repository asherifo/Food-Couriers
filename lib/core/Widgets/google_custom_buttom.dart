import 'package:flutter/material.dart';
class GoogleCustomButtom extends StatelessWidget {
  final String title;
  VoidCallback onPress;
   GoogleCustomButtom({super.key,required this.onPress, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: 300,
        height: 60,
        decoration: BoxDecoration(
          color: Color.fromRGBO(244, 244, 244, 1),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                "assets/images/google.png",
                height: 20,
                width: 20,
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight(700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
