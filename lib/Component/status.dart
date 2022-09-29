// ignore_for_file: camel_case_types, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Globle.dart';

class statusComponets extends StatefulWidget {
  const statusComponets({Key? key}) : super(key: key);

  @override
  State<statusComponets> createState() => _statusComponetsState();
}

class _statusComponetsState extends State<statusComponets> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return (Globle.isIos == false)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                child: Row(
                  children: [
                    const CircleAvatar(
                      maxRadius: 25,
                      backgroundColor: Color(0xff075E54),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    SizedBox(width: (Globle.isIos == false) ? 20 : 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "My status",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            letterSpacing: 0.1,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          "Tap to add status update",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 15, right: 15),
                child: Text(
                  "Resend updates",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                height: _height * 0.7,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: Globle.status
                        .map(
                          (e) => Column(
                            children: [
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, top: 15, right: 15),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 28,
                                      backgroundColor: const Color(0xff075E54),
                                      child: CircleAvatar(
                                        maxRadius: 25,
                                        backgroundColor:
                                            Colors.white.withOpacity(0.5),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${e["name"]}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            letterSpacing: 0.1,
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Text(
                                          "Today ${e["time"]}",
                                          style: (Globle.isIos == false)
                                              ? const TextStyle()
                                              : const TextStyle(
                                                  fontSize: 15,
                                                ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          )
        : Column(
            children: [
              Container(
                height: 157,
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      "Status",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        color: Color(0xff075E54),
                        letterSpacing: 0.1,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const CircleAvatar(
                          maxRadius: 25,
                          backgroundColor: Color(0xff075E54),
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "My status",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                letterSpacing: 0.1,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              "Tap to add status update",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Resend updates",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 450,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: Globle.calls
                        .map(
                          (e) => Column(
                            children: [
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, top: 15, right: 15),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 27,
                                      backgroundColor: const Color(0xff075E54),
                                      child: CircleAvatar(
                                        maxRadius: 25,
                                        backgroundColor:
                                            Colors.white.withOpacity(0.5),
                                      ),
                                    ),
                                    SizedBox(
                                        width:
                                            (Globle.isIos == false) ? 20 : 15),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${e["name"]}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            letterSpacing: 0.1,
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Text(
                                          "Today ${e["time"]}",
                                          style: (Globle.isIos == false)
                                              ? const TextStyle()
                                              : const TextStyle(
                                                  fontSize: 15,
                                                ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          );
  }
}
