// ignore_for_file: camel_case_types, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:registration_6/spalshscreen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Colors.red,
        secondary: Colors.red,
      )),
      debugShowCheckedModeBanner: false,
      initialRoute: "spalshScreen",
      routes: {
        '/': (context) => const home(),
        'spalshScreen': (context) => const spalshScreen(),
      },
    ),
  );
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int initialStepVal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stepper App"),
      ),
      body: Stepper(
        physics: const BouncingScrollPhysics(),
        currentStep: initialStepVal,
        onStepTapped: (val) {
          setState(() {
            initialStepVal = val;
          });
        },
        onStepContinue: () {
          if (initialStepVal < 2) {
            setState(() {
              ++initialStepVal;
            });
          }
        },
        onStepCancel: () {
          if (initialStepVal > 0) {
            setState(() {
              --initialStepVal;
            });
          }
        },
        steps: [
          Step(
            isActive: (initialStepVal >= 0) ? true : false,
            title: const Text("SignUp"),
            content: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      size: 30,
                    ),
                    hintText: "Enter Full Name",
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.mail,
                      size: 30,
                    ),
                    hintText: "Enter Email Id",
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      size: 30,
                    ),
                    hintText: "Enter Password",
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      size: 30,
                    ),
                    hintText: "Enter Confirm Password",
                  ),
                ),
              ],
            ),
          ),
          Step(
            isActive: (initialStepVal >= 1) ? true : false,
            title: const Text("Login"),
            content: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      size: 30,
                    ),
                    hintText: "Enter User Name",
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      size: 30,
                    ),
                    hintText: "Enter Password",
                  ),
                ),
              ],
            ),
          ),
          Step(
              isActive: (initialStepVal >= 2) ? true : false,
              title: const Text("Home"),
              content: Container()),
        ],
      ),
    );
  }
}
