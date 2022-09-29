// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:play__store_and_app_store/Globle.dart';

class SearchComponets extends StatefulWidget {
  const SearchComponets({Key? key}) : super(key: key);

  @override
  State<SearchComponets> createState() => _SearchComponetsState();
}

class _SearchComponetsState extends State<SearchComponets> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    //
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: _height * 0.07),
          const CupertinoSearchTextField(
            itemColor: Colors.black,
          ),
          SizedBox(
            height: _height * 0.745,
            width: _width,
            child: ListView.separated(
              itemCount: Globle.searchList.length,
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
                          image:
                              NetworkImage("${Globle.searchList[i]["images"]}"),
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
                            "${Globle.searchList[i]["name"]}",
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
                            "${Globle.searchList[i]["subname"]}",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textWidthBasis: TextWidthBasis.parent,
                            style: TextStyle(
                              fontSize: 15,
                              color: CupertinoColors.black.withOpacity(0.4),
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
      ),
    );
  }
}
