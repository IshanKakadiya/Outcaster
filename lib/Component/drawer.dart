// ignore_for_file: camel_case_types, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';

class drawer extends StatefulWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        GestureDetector(
          child: Container(
            height: _height,
            width: _width,
            color: Colors.transparent,
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        SizedBox(
          width: _width * 0.75,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  color: const Color(0xff075E54),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 35),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 70),
                          CircleAvatar(
                            radius: 55,
                            backgroundColor: Colors.white.withOpacity(0.7),
                            child: const Icon(
                              Icons.person,
                              size: 80,
                              color: Color(0xff075E54),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Ishan Kakadiya",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "+91 63542 79744",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.group_sharp,
                            size: 30,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          const SizedBox(width: 30),
                          const Text(
                            "New Group",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          Icon(
                            Icons.contact_page_outlined,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          const SizedBox(width: 30),
                          const Text(
                            "New Contact",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          Icon(
                            Icons.phone,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          const SizedBox(width: 30),
                          const Text(
                            "New Calls",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          Icon(
                            Icons.bookmark,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          const SizedBox(width: 30),
                          const Text(
                            "Saved Massages",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          Icon(
                            Icons.settings,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          const Text(
                            "Settings",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
