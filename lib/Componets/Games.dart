// ignore_for_file: camel_case_types, no_leading_underscores_for_local_identifiers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:play__store_and_app_store/Globle.dart';

class gamesComponets extends StatefulWidget {
  const gamesComponets({Key? key}) : super(key: key);

  @override
  State<gamesComponets> createState() => _gamesComponetsState();
}

class _gamesComponetsState extends State<gamesComponets> {
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
                      "Games",
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
                    itemCount: Globle.gamesList.length,
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
                                    "${Globle.gamesList[i]["images"]}"),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 170,
                                child: Text(
                                  "${Globle.gamesList[i]["name"]}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 2),
                              SizedBox(
                                width: 170,
                                child: Text(
                                  "${Globle.gamesList[i]["subname"]}",
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
                            width: 65,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: CupertinoColors.black.withOpacity(0.07),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: const Text(
                              "GET",
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
                const Text(
                  "Games",
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
                    itemCount: Globle.gamesList.length,
                    separatorBuilder: (context, i) => const SizedBox(height: 3),
                    itemBuilder: (context, i) => Container(
                      height: 76,
                      width: _width,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "${i + 1} ",
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "${Globle.gamesList[i]["images"]}"),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: (i == 9) ? 214 : 222,
                                child: Text(
                                  "${Globle.gamesList[i]["name"]}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 2),
                              SizedBox(
                                width: (i == 9) ? 214 : 222,
                                child: Text(
                                  "${Globle.gamesList[i]["subname"]}",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  textWidthBasis: TextWidthBasis.parent,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color:
                                        CupertinoColors.black.withOpacity(0.6),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                "${Globle.gamesList[i]["rat"]}",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                textWidthBasis: TextWidthBasis.parent,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: CupertinoColors.black.withOpacity(0.8),
                                ),
                              ),
                            ],
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
