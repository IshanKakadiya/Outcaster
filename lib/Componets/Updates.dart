// ignore_for_file: no_leading_underscores_for_local_identifiers, file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:play__store_and_app_store/Globle.dart';

class UpdatesComponets extends StatefulWidget {
  const UpdatesComponets({Key? key}) : super(key: key);

  @override
  State<UpdatesComponets> createState() => _UpdatesComponetsState();
}

class _UpdatesComponetsState extends State<UpdatesComponets> {
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
                      "Update Games",
                      style: TextStyle(
                        fontSize: 30,
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
                const SizedBox(height: 10),
                SizedBox(
                  height: _height * 0.745,
                  width: _width,
                  child: ListView.separated(
                    itemCount: Globle.updateList.length,
                    separatorBuilder: (context, i) => Divider(
                      color: CupertinoColors.black.withOpacity(0.3),
                      thickness: 1,
                      indent: 70,
                      height: 0,
                    ),
                    itemBuilder: (context, i) => Container(
                      height: 75,
                      width: _width,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "${Globle.updateList[i]["images"]}"),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 165,
                                child: Text(
                                  "${Globle.updateList[i]["name"]}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 2),
                              SizedBox(
                                width: 165,
                                child: Text(
                                  "${Globle.updateList[i]["subname"]} - New Update Available",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  textWidthBasis: TextWidthBasis.parent,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color:
                                        CupertinoColors.black.withOpacity(0.4),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            height: 30,
                            width: 80,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: CupertinoColors.black.withOpacity(0.07),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: const Text(
                              "UPDATE",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
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
                Row(
                  children: [
                    Text(
                      "Apps(${Globle.updateList.length})",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 30,
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: CupertinoColors.black.withOpacity(0.07),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: const Text(
                        "Update all",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: _height * 0.745,
                  width: _width,
                  child: ListView.separated(
                    itemCount: Globle.updateList.length,
                    separatorBuilder: (context, i) => const SizedBox(height: 2),
                    itemBuilder: (context, i) => Container(
                      height: 65,
                      width: _width,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "${Globle.updateList[i]["images"]}"),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 160,
                                child: Text(
                                  "${Globle.updateList[i]["name"]}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 3),
                              SizedBox(
                                width: 160,
                                child: Text(
                                  "${Globle.updateList[i]["subname"]} - New Update Available",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  textWidthBasis: TextWidthBasis.parent,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color:
                                        CupertinoColors.black.withOpacity(0.7),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            height: 30,
                            width: 80,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black.withOpacity(0.2),
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: const Text(
                              "Update",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
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
