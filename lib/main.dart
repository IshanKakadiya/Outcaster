// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:play__store_and_app_store/Componets/Apps.dart';
import 'package:play__store_and_app_store/Componets/Games.dart';
import 'package:play__store_and_app_store/Componets/Search.dart';
import 'package:play__store_and_app_store/Componets/Updates.dart';
import 'package:play__store_and_app_store/Componets/today.dart';
import 'package:play__store_and_app_store/Globle.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() {
  runApp(
    Phoenix(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  int initialCupertinoTableindex = 0;
  int initialTableindex = 0;
  late TabController _controller;
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    Globle.isIos = false;
    _controller = TabController(length: 4, vsync: this);
  }

  List<Widget> pages = [
    const todayComponets(),
    const AppsComponets(),
    const gamesComponets(),
    const UpdatesComponets(),
  ];

  @override
  Widget build(BuildContext context) {
    return (Globle.isIos)
        ? CupertinoApp(
            debugShowCheckedModeBanner: false,
            theme: const CupertinoThemeData(),
            home: CupertinoPageScaffold(
              backgroundColor: CupertinoColors.white,
              resizeToAvoidBottomInset: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IndexedStack(
                    index: initialCupertinoTableindex,
                    children: const [
                      todayComponets(),
                      gamesComponets(),
                      AppsComponets(),
                      UpdatesComponets(),
                      SearchComponets(),
                    ],
                  ),
                  const Spacer(),
                  CupertinoTabBar(
                    currentIndex: initialCupertinoTableindex,
                    onTap: (val) {
                      setState(() {
                        initialCupertinoTableindex = val;
                        Globle.isIos;
                      });
                    },
                    backgroundColor: CupertinoColors.white,
                    border: Border.all(),
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.today), label: "Today"),
                      BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.game_controller),
                          label: "Games"),
                      BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.app_fill), label: "Apps"),
                      BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.arrow_up_arrow_down),
                          label: "Updates"),
                      BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.search), label: "Search"),
                    ],
                  ),
                ],
              ),
            ),
          )
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Colors.white,
            )),
            home: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                title: CupertinoSearchTextField(
                  placeholder: "Click Here To IOS",
                  onTap: () {
                    setState(() {
                      Globle.isIos = true;
                    });
                  },
                  backgroundColor: Colors.black.withOpacity(0.1),
                ),
                bottom: TabBar(
                  physics: const BouncingScrollPhysics(),
                  controller: _controller,
                  onTap: (val) {
                    setState(() {
                      initialTableindex = val;
                    });

                    pageController.animateToPage(
                      val,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeInOut,
                    );
                  },
                  indicatorWeight: 2,
                  isScrollable: true,
                  labelStyle: const TextStyle(fontSize: 15),
                  unselectedLabelColor: Colors.black.withOpacity(0.4),
                  labelColor: Colors.black,
                  tabs: const [
                    Tab(child: Text("For you")),
                    Tab(child: Text("Apps")),
                    Tab(child: Text("Games")),
                    Tab(child: Text("Updates")),
                  ],
                ),
              ),
              body: PageView.builder(
                controller: pageController,
                onPageChanged: (val) {
                  setState(() {
                    initialTableindex = val;
                  });

                  _controller.animateTo(val);
                },
                physics: const BouncingScrollPhysics(),
                itemCount: pages.length,
                itemBuilder: (context, i) => pages[i],
              ),
            ),
          );
  }
}
