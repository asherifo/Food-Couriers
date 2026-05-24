import 'package:flutter/material.dart';
import 'package:untitled1/features/AuthPages/presentation/Widget/login.dart';
import 'package:untitled1/features/AuthPages/presentation/Widget/sign_up.dart';

import '../../../../core/Colors/colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 2,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.4,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/images/intro2.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30, vertical: 20),
                child: TabBar(
                  indicatorColor: AppColors.Primary,
                  labelColor: AppColors.Primary,
                  unselectedLabelColor: Colors.black,
                  labelStyle: TextStyle(
                      fontWeight: FontWeight(700), fontSize: 14),
                  tabs: [
                    Tab(text: "Create Account"),
                    Tab(text: "Login"),
                  ],
                ),
              ),


              SizedBox(
                height: 400,
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    MyCustomCreateAcc(),
                    MyCustomLoginPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}

