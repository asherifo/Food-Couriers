import 'package:flutter/material.dart';

class MyCustomLoginPage extends StatefulWidget {
  const MyCustomLoginPage({super.key,});

  @override
  State<MyCustomLoginPage> createState() => _MyCustomLoginPageState();
}

class _MyCustomLoginPageState extends State<MyCustomLoginPage> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          TextField(decoration: InputDecoration(labelText: 'Email address'),controller: email,),
          SizedBox(height: 15),
          TextField(
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
            controller: password,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Forgot Password?",
                style: TextStyle(color: Color.fromRGBO(214, 19, 85, 1)),
              ),
            ),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {

              print(email.text);
              print(password.text);
            },
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: Color.fromRGBO(214, 19, 85, 1),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Center(
                child: Text(
                  "Login",
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
                      "Login with Google",
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
