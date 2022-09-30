// ignore_for_file: no_leading_underscores_for_local_identifiers, file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:play__store_and_app_store/Globle.dart';

class AppsComponets extends StatefulWidget {
  const AppsComponets({Key? key}) : super(key: key);

  @override
  State<AppsComponets> createState() => _AppsComponetsState();
}

class _AppsComponetsState extends State<AppsComponets> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    //
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: (Globle.isIos)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: _height * 0.07),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Apps Categories",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    CircleAvatar(
                      maxRadius: 20,
                      backgroundColor: CupertinoColors.black,
                      child: Icon(
                        CupertinoIcons.person,
                        color: CupertinoColors.white,
                      ),
                    ),
                  ],
                ),
                // const SizedBox(height: 10),
                SizedBox(
                  height: _height * 0.78,
                  width: _width,
                  child: ListView.separated(
                    itemCount: Globle.appsList.length,
                    separatorBuilder: (context, i) => Divider(
                      color: CupertinoColors.black.withOpacity(0.3),
                      thickness: 1,
                      indent: 65,
                      height: 0,
                    ),
                    itemBuilder: (context, i) => Container(
                      width: _width,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "${Globle.appsList[i]["images"]}"),
                              ),
                            ),
                          ),
                          const SizedBox(width: 25),
                          Text(
                            "${Globle.appsList[i]["name"]}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
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
                  "Categories",
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
                    itemCount: Globle.appsList.length,
                    separatorBuilder: (context, i) => const SizedBox(height: 5),
                    itemBuilder: (context, i) => Container(
                      width: _width,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "${Globle.appsList[i]["images"]}"),
                              ),
                            ),
                          ),
                          const SizedBox(width: 25),
                          Text(
                            "${Globle.appsList[i]["name"]}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
