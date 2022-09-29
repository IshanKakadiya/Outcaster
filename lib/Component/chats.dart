// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Globle.dart';

class chatsComponets extends StatefulWidget {
  const chatsComponets({Key? key}) : super(key: key);

  @override
  State<chatsComponets> createState() => _chatsComponetsState();
}

class _chatsComponetsState extends State<chatsComponets> {
  @override
  Widget build(BuildContext context) {
    //
    return (Globle.isIos == false)
        ? SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: Globle.contacts
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
                                  const SizedBox(height: 3),
                                  Text(
                                    "${e["desc"]}",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Text(
                                "${e["time"]}",
                                style: (Globle.isIos == false)
                                    ? const TextStyle()
                                    : const TextStyle(
                                        fontSize: 15,
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          )
        : Column(
            children: [
              Container(
                height: 169,
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
                  children: [
                    const Spacer(),
                    const CupertinoSearchTextField(
                      itemColor: Colors.black,
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: const [
                        Text(
                          "Broadcast Lists",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xff075E54),
                            letterSpacing: 0.1,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "New Group",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xff075E54),
                            letterSpacing: 0.1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 490,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: Globle.contacts
                        .map(
                          (e) => Column(
                            children: [
                              Container(
                                color: Colors.grey.withOpacity(0.01),
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
                                    const SizedBox(width: 15),
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
                                        const SizedBox(height: 5),
                                        Text(
                                          "${e["desc"]}",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Text(
                                      "${e["time"]}",
                                      style: (Globle.isIos == false)
                                          ? const TextStyle()
                                          : const TextStyle(
                                              fontSize: 15,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                color: Colors.black,
                                thickness: 0.3,
                                indent: 80,
                                endIndent: 15,
                                height: 9,
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
