// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class TextFormFieldWidgets extends StatelessWidget {
  final Function validator;
  final String name;

  TextFormFieldWidgets({required this.validator, required this.name});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator(),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock, color: Colors.black),
        border: OutlineInputBorder(),
        hintText: name,
        hintStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
