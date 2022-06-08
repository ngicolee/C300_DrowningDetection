import 'package:c300drowningdetection/colorpalette.dart';
import 'package:flutter/material.dart';

class PasswordInputField extends StatelessWidget {
  const PasswordInputField({
    Key? key,
    required this.inputIcon,
    required this.inputField,
    required this.inputType,
    required this.inputAction,
  }) : super(key: key);

  final IconData inputIcon;
  final String inputField;
  final TextInputType inputType;
  final TextInputAction inputAction;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
          height: size.height * 0.08,
          width: size.width * 0.8,
          decoration: BoxDecoration(
            color: Colors.grey[500]?.withOpacity(0.5),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: inputField,
                hintStyle: bodyText,
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Icon(
                    inputIcon,
                    size: 28,
                    color: Colors.white,
                  ),
                ),
              ),
              obscureText: true,
              style: bodyText,
              keyboardType: inputType,
              textInputAction: inputAction,
            ),
          )),
    );
  }
}