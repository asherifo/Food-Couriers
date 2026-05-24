
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/core/Widgets/custom_button.dart';
import 'package:untitled1/core/Widgets/custom_textformf.dart';
import '../../../../core/Colors/colors.dart';
import '../../../../core/Widgets/google_custom_buttom.dart';
import '../../Logic/auth_cubit.dart';
import '../../Logic/auth_state.dart';


class MyCustomLoginPage extends StatefulWidget {
  const MyCustomLoginPage({super.key});

  @override
  State<MyCustomLoginPage> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<MyCustomLoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(

        body: Padding(
          padding: const EdgeInsets.only(right: 15,left: 15),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextformf(lTxt: 'UserName', controller: _usernameController, validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter your Name';
                  }
                  return null;
                }, icon: Icon(Icons.person_outline)),

                const SizedBox(height: 16),
                CustomTextformf(lTxt: 'Password', controller: _passwordController, validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter your Password';
                  }
                  return null;
                }, icon: Icon(Icons.password),),

                const SizedBox(height: 24),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      String name = state.userData['firstName'] ?? 'User';
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Welcome $name Now you are Logged!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.pushReplacementNamed(context, '/Profile');
                    }
                    if (state is AuthFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.errorMessage),
                          backgroundColor: AppColors.Primary,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return const CircularProgressIndicator();
                    }
                    return SizedBox(
                      height: 60,
                      child: MyCustomButton(title: 'Login', width: 300, onPress: (){
                        if (_formKey.currentState!.validate()) {
                                context.read<AuthCubit>().loginUser(
                                  _usernameController.text.trim(),
                                  _passwordController.text.trim(),
                                );
                              }
                      }
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                GoogleCustomButtom(title:'Login with Google',onPress: (){},),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

