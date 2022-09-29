// ignore_for_file: camel_case_types, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:cupertino_store_layout/Globle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cartComponents extends StatefulWidget {
  const cartComponents({Key? key}) : super(key: key);

  @override
  State<cartComponents> createState() => _cartComponentsState();
}

class _cartComponentsState extends State<cartComponents> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    DateTime curraentDate = DateTime.now();
    String selectDate = "";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            "Shpping Cart",
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Divider(
          thickness: 0.8,
          height: 0,
        ),
        Container(
          height: _height * 0.786,
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CupertinoTextField.borderless(
                  prefix: Icon(
                    CupertinoIcons.person,
                    color: CupertinoColors.black.withOpacity(0.3),
                  ),
                  placeholder: "Name",
                  placeholderStyle: TextStyle(
                    color: CupertinoColors.black.withOpacity(0.3),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: CupertinoColors.black.withOpacity(0.3),
                ),
                CupertinoTextField.borderless(
                  prefix: Icon(
                    CupertinoIcons.mail_solid,
                    color: CupertinoColors.black.withOpacity(0.3),
                  ),
                  placeholder: "Email",
                  placeholderStyle: TextStyle(
                    color: CupertinoColors.black.withOpacity(0.3),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: CupertinoColors.black.withOpacity(0.3),
                ),
                CupertinoTextField.borderless(
                  prefix: Icon(
                    CupertinoIcons.location,
                    color: CupertinoColors.black.withOpacity(0.3),
                  ),
                  placeholder: "Location",
                  placeholderStyle: TextStyle(
                    color: CupertinoColors.black.withOpacity(0.3),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: CupertinoColors.black.withOpacity(0.3),
                ),
                CupertinoTextField.borderless(
                  prefix: Icon(
                    CupertinoIcons.time,
                    color: CupertinoColors.black.withOpacity(0.3),
                  ),
                  placeholder: "Delivery time              Jan 9, 2022 4:00 PM",
                  placeholderStyle: TextStyle(
                    color: CupertinoColors.black.withOpacity(0.3),
                  ),
                ),
                const SizedBox(height: 9),
                Container(
                  height: 254,
                  width: _width,
                  color: Colors.white,
                  child: CupertinoDatePicker(
                    backgroundColor: CupertinoColors.white,
                    initialDateTime: curraentDate,
                    onDateTimeChanged: (val) {},
                  ),
                ),
                ...Globle.cartShopping
                    .map(
                      (e) => Container(
                        height: 60,
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
                              height: 45,
                              width: 40,
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
                                const SizedBox(height: 3),
                                Text(
                                  "\$ ${e["price"]}.00",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color:
                                        CupertinoColors.black.withOpacity(0.4),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              "\$${e["price"]}.00",
                              style: const TextStyle(
                                fontSize: 15,
                                // color: CupertinoColors.black.withOpacity(0.4),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Shipping  \$ 170.00",
                            style: TextStyle(
                              fontSize: 13,
                              color: CupertinoColors.black.withOpacity(0.4),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Tax \$ 12.01",
                            style: TextStyle(
                              fontSize: 13,
                              color: CupertinoColors.black.withOpacity(0.4),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Tax \$ 157.99",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
