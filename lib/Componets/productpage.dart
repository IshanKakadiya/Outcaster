// ignore_for_file: camel_case_types, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:cupertino_store_layout/Globle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class productComponets extends StatefulWidget {
  const productComponets({Key? key}) : super(key: key);

  @override
  State<productComponets> createState() => _productComponetsState();
}

class _productComponetsState extends State<productComponets> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            "Cupertino Store",
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: _height * 0.78,
          width: _width,
          child: SingleChildScrollView(
            child: Column(
              children: Globle.product
                  .map(
                    (e) => Column(
                      children: [
                        Container(
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
                                        color: CupertinoColors.black
                                            .withOpacity(0.4),
                                      )),
                                ],
                              ),
                              const Spacer(),
                              Icon(
                                CupertinoIcons.add_circled,
                                color:
                                    CupertinoColors.systemBlue.withOpacity(0.7),
                                size: 28,
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          height: 0,
                          thickness: 1,
                          indent: 90,
                          endIndent: 20,
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
