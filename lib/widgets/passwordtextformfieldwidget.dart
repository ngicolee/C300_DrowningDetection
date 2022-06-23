// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class PasswordTextFormFieldWidget extends StatelessWidget {
  final bool obscureText;
  final Function validator;
  final String name;
  final Function onTap;

  PasswordTextFormFieldWidget(
      {required this.obscureText,
      required this.validator,
      required this.name,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: validator(),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock, color: Colors.black),
        border: OutlineInputBorder(),
        hintText: name,
        suffixIcon: GestureDetector(
          onTap: onTap(),
          child: Icon(
              obscureText == true ? Icons.visibility_off : Icons.visibility,
              color: Colors.black),
        ),
        hintStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
