/*
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.currentPage,});
  final bool currentPage;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
bool cp;
    PageController _controller =PageController();
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            // Background Image
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Image.asset("assets/images/intro2.png"),
            ),
            // Section Of User Implementation
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 236.0),
                child: Container(

                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(7)),
                  child: Padding(
                       padding: EdgeInsets.only(top: 30),

                    child: Column(
                      children: [

                        Row(spacing: 80,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(onTap: (){ _controller.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear,
                            );



                              },child: Center(child: SizedBox(
                                height: 30,
                                child: Text('Create Account',style: TextStyle(color:  Colors.red ,fontSize: 16 ,fontWeight: FontWeight(700)),)),)),
                            InkWell(onTap: (){ _controller.nextPage(
                              duration: const Duration(milliseconds:300),
                              curve: Curves.linear,
                            );

                             ;
                              },child: Center(child: SizedBox(
                              height: 30,
                                child: Text('Login', style: TextStyle(color:Colors.black, fontSize: 16 ,fontWeight: FontWeight(700)),)),)),

                          ],
                        ),
                        SizedBox(height: 30,),
                        SizedBox(
                          height: 270.6,
                          child: PageView(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            controller: _controller,
                            children: [
                              // Create Account Page
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(flex: 2,child: Text('    Full Name',style: TextStyle(fontSize: 14,fontWeight: FontWeight(500)),),),

                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "",
                                    //  prefixIcon: Icon(Icons.person),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  Expanded(flex: 2,child: Text('    Email Address',style: TextStyle(fontSize: 14,fontWeight: FontWeight(500)),),),

                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "",
                                      //  prefixIcon: Icon(Icons.person),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  Expanded(flex: 2,child: Text('    Password',style: TextStyle(fontSize: 14,fontWeight: FontWeight(500)),),),

                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "********",
                                      //  prefixIcon: Icon(Icons.person),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // Login Page
                              Container(color: Colors.red,)


                            ],

                          ),
                        ),

                      ],
                    ),
                  )

                ),
              ),
            )
          ],
        ),
      )
    );
  }
}


*/


import 'package:flutter/material.dart';
import 'package:untitled1/features/AuthPages/presentation/Widget/login.dart';
import 'package:untitled1/features/AuthPages/presentation/Widget/sign_up.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // لون خلفية التطبيق
      body: DefaultTabController(
        length: 2, // عدد التبويبات
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 1. الجزء الخاص بالصورة العلوية
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
                    // استبدلها برابط الصورة أو Asset
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // 2. شريط التبديل (TabBar)
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30, vertical: 20),
                child: TabBar(
                  indicatorColor: Color.fromRGBO(214, 19, 85, 1),
                  // اللون الأحمر في التصميم
                  labelColor: Color.fromRGBO(214, 19, 85, 1),
                  unselectedLabelColor: Colors.black,
                  labelStyle: TextStyle(
                      fontWeight: FontWeight(700), fontSize: 14),
                  tabs: [
                    Tab(text: "Create Account"),
                    Tab(text: "Login"),
                  ],
                ),
              ),

              // 3. محتوى الحقول (TabBarView)
              SizedBox(
                height: 400, // حدد طول مناسب للحقول
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    MyCustomCreateAcc(), // دالة لبناء واجهة التسجيل
                    MyCustomLoginPage(), // دالة لبناء واجهة الدخول
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
