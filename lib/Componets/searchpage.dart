// ignore_for_file: camel_case_types

import 'package:cupertino_store_layout/Globle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class searchComponets extends StatefulWidget {
  const searchComponets({Key? key}) : super(key: key);

  @override
  State<searchComponets> createState() => searchComponetsState();
}

class searchComponetsState extends State<searchComponets> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: CupertinoSearchTextField(
            backgroundColor: CupertinoColors.systemGrey.withOpacity(0.4),
          ),
        ),
        Column(
            children: Globle.searchProduct
                .map(
                  (e) => Container(
                    height: 90,
                    width: double.infinity,
                    color: Colors.white,
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 10,
                      bottom: 10,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 70,
                          width: 60,
                          decoration: BoxDecoration(
                            color: CupertinoColors.white,
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                e["image"],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 17),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e["name"]),
                            const SizedBox(height: 6),
                            Text("\$ ${e["price"]}",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: CupertinoColors.black.withOpacity(0.4),
                                )),
                          ],
                        ),
                        const Spacer(),
                        Icon(
                          CupertinoIcons.add_circled,
                          color: CupertinoColors.systemBlue.withOpacity(0.7),
                          size: 28,
                        ),
                      ],
                    ),
                  ),
                )
                .toList()),
      ],
    );
  }
}
