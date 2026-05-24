import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/core/Widgets/custom_button.dart';
import 'package:untitled1/core/Widgets/google_custom_buttom.dart';

import '../../../../core/Colors/colors.dart';
import '../../Logic/auth_cubit.dart';
import '../../Logic/auth_state.dart';


class MyCustomCreateAcc extends StatefulWidget {
  const MyCustomCreateAcc({super.key});

  @override
  State<MyCustomCreateAcc> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<MyCustomCreateAcc> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? _gender;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: SizedBox(
//height: 600,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(controller: _nameController, decoration: const InputDecoration(prefixIcon: Icon(Icons.person_outline),labelText: '  UserName',border: UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))), validator: (v) => v!.isEmpty ? 'Required' : null),
                const SizedBox(height: 10),
                TextFormField(controller: _emailController, decoration: const InputDecoration(prefixIcon: Icon(Icons.email_outlined),labelText: '  Email Account',border: UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))), validator: (v) => !v!.contains('@') ? 'Email is InCorrect' : null),
                const SizedBox(height: 10),
                TextFormField(controller: _phoneController, decoration: const InputDecoration(prefixIcon: Icon(Icons.phone),labelText: '  Phone',border: UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))), keyboardType: TextInputType.phone),
                const SizedBox(height: 10),


                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(prefixIcon: Icon(Icons.person_add_alt),labelText: '  Gender',border: UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))),
                  items: ['Male', 'Female'].map((g) => DropdownMenuItem(value: g, child: Text(g))).toList(),
                  onChanged: (v) => setState(() => _gender = v),
                ),

                const SizedBox(height: 10),
                TextFormField(controller: _passwordController, obscureText: true, decoration: const InputDecoration(prefixIcon: Icon(Icons.password),labelText: '  Password ',border: UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))), validator: (v) => v!.isEmpty ? 'Required' : null,),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(prefixIcon: Icon(Icons.password),labelText: '  Confirmed Password',border: UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))),
                  validator: (v) => v != _passwordController.text ? 'Password is InCorrect' : null,
                ),

                const SizedBox(height: 20),

                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is SignupSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Created Account Successfully'), backgroundColor: Colors.green));
                    } else if (state is AuthFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage), backgroundColor: AppColors.Primary));
                    }
                  },
                  builder: (context, state) {
                    return state is AuthLoading
                        ? const CircularProgressIndicator()
                    : MyCustomButton(title: 'Sign up', width: 300, onPress: (){
                      if (_formKey.currentState!.validate()) {
                              context.read<AuthCubit>().signupUser(
                                  _nameController.text,
                                  _emailController.text,
                                  _passwordController.text
                              );
                              Navigator.pushReplacementNamed(context, '/Profile');
                            }

                    });
                  },
                ),
                SizedBox(height: 20),
                GoogleCustomButtom(title:'Sign up with Google',onPress: (){},),
                SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}