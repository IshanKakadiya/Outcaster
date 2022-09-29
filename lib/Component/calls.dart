// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Globle.dart';

class callsComponets extends StatefulWidget {
  const callsComponets({Key? key}) : super(key: key);

  @override
  State<callsComponets> createState() => _callsComponetsState();
}

class _callsComponetsState extends State<callsComponets> {
  @override
  Widget build(BuildContext context) {
    return (Globle.isIos == false)
        ? Column(
            children: Globle.calls
                .map(
                  (e) => Column(
                    children: [
                      const SizedBox(height: 5),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, top: 15, right: 15),
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
                            const SizedBox(width: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${e["name"]}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    letterSpacing: 0.1,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "${e["time"]}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            GestureDetector(
                              child: const Icon(
                                Icons.phone,
                                color: Colors.green,
                              ),
                              onTap: () async {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          )
        : Column(
            children: [
              Container(
                height: 120,
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
                  children: const [
                    SizedBox(height: 10),
                    Text(
                      "Calls",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        color: Color(0xff075E54),
                        letterSpacing: 0.1,
                      ),
                    ),
                    SizedBox(height: 10),
                    CupertinoSearchTextField(
                      itemColor: Colors.black,
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
              SizedBox(
                height: 490,
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
                                    const CircleAvatar(
                                      maxRadius: 25,
                                      backgroundColor: Color(0xff075E54),
                                      child: Icon(
                                        Icons.person,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
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
                                        const SizedBox(height: 4),
                                        Text(
                                          "+91 ${e["no"]}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        Text(
                                          "${e["time1"]}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        GestureDetector(
                                          child: const Icon(
                                            CupertinoIcons
                                                .exclamationmark_circle,
                                            color: Colors.green,
                                            size: 25,
                                          ),
                                          onTap: () {},
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
