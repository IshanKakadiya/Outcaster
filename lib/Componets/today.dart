// ignore_for_file: camel_case_types, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:play__store_and_app_store/Globle.dart';

class todayComponets extends StatefulWidget {
  const todayComponets({Key? key}) : super(key: key);

  @override
  State<todayComponets> createState() => _todayComponetsState();
}

class _todayComponetsState extends State<todayComponets> {
  @override
  Widget build(BuildContext context) {
    //
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: (Globle.isIos)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: _height * 0.07),
                Text(
                  "FRIDAY, JUN 24",
                  style: TextStyle(
                    color: CupertinoColors.black.withOpacity(0.4),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Today",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    CupertinoSwitch(
                        value: Globle.isIos,
                        activeColor: Colors.black.withOpacity(0.3),
                        thumbColor: Colors.black,
                        trackColor: Colors.black.withOpacity(0.3),
                        onChanged: (val) {
                          setState(() {
                            Globle.isIos = val;
                          });
                        }),
                    const Spacer(),
                    const CircleAvatar(
                      maxRadius: 20,
                      backgroundColor: CupertinoColors.black,
                      child: Icon(
                        CupertinoIcons.person,
                        color: CupertinoColors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: _height * 0.745,
                  width: _width,
                  child: ListView.separated(
                    itemCount: Globle.todayList.length,
                    separatorBuilder: (context, i) =>
                        const SizedBox(height: 35),
                    itemBuilder: (context, i) => Container(
                      height: 410,
                      width: _width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage("${Globle.todayList[i]["images"]}"),
                        ),
                        border: Border.all(),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Recommendation",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: _height * 0.75,
                  width: _width,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: Globle.todayList.length,
                    separatorBuilder: (context, i) =>
                        const SizedBox(height: 20),
                    itemBuilder: (context, i) => Container(
                      height: 410,
                      width: _width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage("${Globle.todayList[i]["images"]}"),
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
