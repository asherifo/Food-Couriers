
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../const/colors.dart';
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

                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'UserName',
                    border: UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter your Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(

                    labelText: 'Password',
                    border: UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                    prefixIcon: Icon(Icons.password),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter your Password';
                    }
                    return null;
                  },
                ),
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
                      // width: double.infinity,
                      height: 60,
                      child: InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthCubit>().loginUser(
                              _usernameController.text.trim(),
                              _passwordController.text.trim(),
                            );
                          }
                        },
                        child:  Container(
                          width:300,
                          height: 60,
                          decoration: BoxDecoration(
                            color: AppColors.Primary,
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
                    );

                  },
                ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {},
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
          ),
        ),
      ),
    );
  }
}

