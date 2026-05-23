import 'package:flutter/cupertino.dart';
import '../features/AuthPages/presentation/Screen/login_page.dart';
import '../features/IntroScreen/presentaion/Screen/intro_screen.dart';
import '../features/Profile/presentation/profile_user_page.dart';
import '../features/SplashScreen/presentation/splash_screen.dart';

Map<String,WidgetBuilder> routes={
  '/Splash': (context)=>const SplashScreen(),
  '/IntroApp': (context)=>const IntroScreen(),
  '/Login': (context)=> LoginPage(),
  '/Profile': (context)=> ProfileUserPage(),

};