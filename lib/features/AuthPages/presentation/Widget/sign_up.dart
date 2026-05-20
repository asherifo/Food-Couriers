import 'package:flutter/material.dart';

class MyCustomCreateAcc extends StatelessWidget {
  const MyCustomCreateAcc({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          TextField(decoration: InputDecoration(labelText: 'Full Name')),
          SizedBox(height: 15),
          TextField(decoration: InputDecoration(labelText: 'Email address')),
          SizedBox(height: 15),
          TextField(
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          SizedBox(height: 30),
          InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: Color.fromRGBO(214, 19, 85, 1),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
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
                      "Sign up with Google",
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
          ),
        ],
      ),
    );
  }
}
