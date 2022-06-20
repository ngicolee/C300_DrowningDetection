import 'package:c300drowningdetection/colorpalette.dart';
import 'package:flutter/material.dart';

class LoginBtn extends StatelessWidget {
  const LoginBtn({
    Key? key,
    required this.btnName,
  }) : super(key: key);

  final String btnName;

  @override
  Widget build(BuildContext context) {
    Size spaceSize = MediaQuery.of(context).size;
    return Container(
      height: spaceSize.height * 0.08,
      width: spaceSize.width * 0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.white),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          btnName,
          style: bodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
