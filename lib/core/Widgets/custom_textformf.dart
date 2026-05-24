import 'package:flutter/material.dart';
class CustomTextformf extends StatelessWidget {
 final TextEditingController controller;
 final String? Function(String?)? validator;
  final String lTxt;
 final Icon icon;
   CustomTextformf({super.key, required this.lTxt,required this.controller,required this.validator, required this.icon});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      decoration:  InputDecoration(
        labelText: lTxt,
        border: UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
        prefixIcon: icon,
      ),
      validator: validator,
    );
  }
}
