import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 6), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context,'/IntroApp' );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(alignment:  Alignment.center,
          children: [
            SingleChildScrollView(
              child: Center(
                    
                child: Container(
                    
                  color: Colors.white,
                    child: Image.asset('assets/images/backgroundsplashscreen.png',fit: BoxFit.cover,)),
              ),
            ),
      
          SingleChildScrollView(
            child: Positioned(
                top: 243,
              left: -60,
              child: Container(
                  
                        width: 484,
                        color: Colors.transparent,
                        child: Center(
                  
                          child: Column(
                            children: [
                              Lottie.asset('assets/animations/delivery_man.json',height:213, ),
                              Container(alignment: Alignment.center,
                                  child: Text('Food Couriers',style:
                                  TextStyle(
                                      height: 1,
                                      fontSize: 45,
                                      fontWeight: FontWeight(900),
                                      color: Color.fromRGBO(219, 19, 85, 1)
                                  ),
                                  ),
                              ),
                  
                            ],
                          ),
                  
                      ),
                    ),
            ),
          ),
      
      
          ],
        ),
      ),
    );
  }
}

