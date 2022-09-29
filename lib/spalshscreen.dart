// ignore_for_file: camel_case_types

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: spalshScreen(),
  ));
}

class spalshScreen extends StatefulWidget {
  const spalshScreen({Key? key}) : super(key: key);

  @override
  State<spalshScreen> createState() => _spalshScreenState();
}

class _spalshScreenState extends State<spalshScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushNamedAndRemoveUntil(
              "/",
              (route) => false,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          FlutterLogo(
            size: 250,
          ),
          SizedBox(height: 110),
          SpinKitPouringHourGlassRefined(
            color: Colors.blue,
          )
        ],
      ),
    ));
  }
}
