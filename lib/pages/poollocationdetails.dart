// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, unnecessary_this

import 'package:c300drowningdetection/models/sublocation.dart';
import 'package:flutter/material.dart';

class PoolLocationDetails extends StatelessWidget {
  SubLocation subLocation;
  PoolLocationDetails({required this.subLocation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(this.subLocation.name),
      ),
    );
  }
}
