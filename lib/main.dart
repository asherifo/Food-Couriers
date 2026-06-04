import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled1/Routes/routes.dart';

import 'features/AuthPages/Logic/auth_cubit.dart';
import 'features/MenuMainApp/logic/menu_cubit.dart';
import 'features/OrderScreen/logic/order_cubit.dart';
import 'features/Profile/logic/profile_cibit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RecipeCubit>(
          create: (context) => RecipeCubit(apiService: ApiServiceMenu())..fetchHomeRecipes(),
        ),
        BlocProvider<CartCubit>(
          create: (context) => CartCubit(),
        ),
        BlocProvider(create:  (context) => AuthCubit(),),
        BlocProvider(create: (context) => UserCubit(ApiService())),
        BlocProvider(create: (context) => RecipeCubit(apiService: ApiServiceMenu())..fetchHomeRecipes(),)
      ],
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        title: 'Delivery Couriers',
        theme: ThemeData(
        fontFamily: 'Poppins',
          textTheme: GoogleFonts.poppinsTextTheme(),
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: '/Splash',
        routes: routes,
      ),
    );
  }
}

