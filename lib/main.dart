// ignore_for_file: camel_case_types, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable, sort_child_properties_last, unused_field, avoid_print, sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp_clone/Component/calls.dart';
import 'package:whatsapp_clone/Component/chats.dart';
import 'package:whatsapp_clone/Component/status.dart';
import 'package:whatsapp_clone/Globle.dart';
import 'Component/drawer.dart';

void main() async {
  runApp(
    home(),
  );
}

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> with TickerProviderStateMixin {
  late TabController _controller;
  PageController pageController = PageController();
  int initialTableindex = 0;
  int initialCupertinoTableindex = 0;

  List<Widget> pages = [
    const chatsComponets(),
    const statusComponets(),
    const callsComponets(),
  ];

  GlobalKey<FormState> addContactValidateKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();

    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ],
    );
    return (Globle.isIos == false)
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: const Color(0xff075E54),
                secondary: const Color(0xff25D366),
              ),
            ),
            home: Scaffold(
              appBar: AppBar(
                title: const Text(
                  "WhatsApp",
                  style: TextStyle(color: Colors.white),
                ),
                actions: [
                  Switch(
                    value: Globle.isIos,
                    activeColor: const Color(0xff075E54),
                    activeTrackColor: const Color(0xff25D366),
                    inactiveTrackColor:
                        const Color(0xff25D366).withOpacity(0.5),
                    onChanged: (val) {
                      setState(() {
                        _controller.index = 0;
                        Globle.isIos = val;
                      });
                    },
                  ),
                  // const SizedBox(width: 10),
                ],
                bottom: TabBar(
                  controller: _controller,
                  onTap: (val) {
                    print(val);
                    setState(() {
                      initialTableindex = val;
                    });

                    pageController.animateToPage(
                      val,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeInOut,
                    );
                  },
                  indicatorColor: Colors.white,
                  indicatorWeight: 2,
                  labelStyle: const TextStyle(fontSize: 15),
                  tabs: const [
                    Tab(child: Text("CHATS")),
                    Tab(child: Text("STATUS")),
                    Tab(child: Text("CALLS")),
                  ],
                ),
                // backgroundColor: Colors.blue[800],
              ),
              drawer: const drawer(),
              floatingActionButton: FloatingActionButton(
                child: Icon(
                    (initialTableindex == 0)
                        ? Icons.add
                        : (initialTableindex == 1)
                            ? Icons.camera_alt_outlined
                            : Icons.phone,
                    size: 25),
                backgroundColor: const Color(0xff128C7E),
                onPressed: () {},
              ),
              body: PageView.builder(
                controller: pageController,
                onPageChanged: (val) {
                  setState(() {
                    print(val);
                    initialTableindex = val;
                  });

                  _controller.animateTo(val);
                },
                physics: const BouncingScrollPhysics(),
                itemCount: pages.length,
                itemBuilder: (context, i) => pages[i],
              ),
              backgroundColor: const Color.fromARGB(241, 232, 232, 243),
            ),
          )
        : CupertinoApp(
            debugShowCheckedModeBanner: false,
            theme: const CupertinoThemeData(
              primaryColor: Color(0xff075E54),
            ),
            home: CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: const Text(
                  "WhatsApp",
                  style: TextStyle(
                    color: CupertinoColors.black,
                  ),
                ),
                leading: Builder(
                  builder: (context) {
                    return GestureDetector(
                      child: const Icon(
                        Icons.menu,
                        color: Colors.black,
                        size: 30,
                      ),
                      onTap: () {
                        showCupertinoDialog(
                          context: context,
                          builder: (context) => const drawer(),
                        );
                      },
                    );
                  },
                ),
                trailing: CupertinoSwitch(
                    value: Globle.isIos,
                    onChanged: (val) {
                      setState(() {
                        Globle.isIos = val;
                      });
                    }),
                backgroundColor: CupertinoColors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  IndexedStack(
                    index: initialCupertinoTableindex,
                    children: const [
                      statusComponets(),
                      chatsComponets(),
                      callsComponets(),
                    ],
                  ),
                  CupertinoTabBar(
                    currentIndex: initialCupertinoTableindex,
                    activeColor: CupertinoColors.activeBlue.darkElevatedColor,
                    onTap: (val) {
                      setState(() {
                        initialCupertinoTableindex = val;
                      });
                    },
                    backgroundColor: CupertinoColors.white,
                    border: const Border(
                      top: BorderSide(color: Colors.black, width: 1),
                    ),
                    height: 60,
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.star),
                        label: "Status",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.chat_bubble_2),
                        label: "Chats",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.phone),
                        label: "Calls",
                      ),
                    ],
                  ),
                ],
              ),
              backgroundColor: CupertinoColors.white,
            ),
          );
  }
}
