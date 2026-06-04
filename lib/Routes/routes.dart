import 'package:flutter/cupertino.dart';
import 'package:untitled1/features/DetailScreen/presentation/detail_screen.dart';
import 'package:untitled1/features/MenuMainApp/presenration/menu_page.dart';
import 'package:untitled1/features/OrderScreen/presentation/order_detail_Screen.dart';
import '../features/AuthPages/presentation/Screen/login_page.dart';
import '../features/IntroScreen/presentaion/Screen/intro_screen.dart';
import '../features/Profile/presentation/profile_user_page.dart';
import '../features/SplashScreen/presentation/splash_screen.dart';

Map<String,WidgetBuilder> routes={
  '/Splash': (context)=>const SplashScreen(),
  '/IntroApp': (context)=>const IntroScreen(),
  '/Login': (context)=> LoginPage(),
  '/Profile': (context)=> ProfilePage(),
  '/Menu': (context)=> MenuPage(),
  '/DetailItems': (context)=> DetailScreen(),
  '/OrderDetail': (context)=> OrderDetailsScreen(),

};