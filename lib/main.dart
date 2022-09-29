import 'package:cupertino_store_layout/Componets/cartpage.dart';
import 'package:cupertino_store_layout/Componets/productpage.dart';
import 'package:cupertino_store_layout/Componets/searchpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int initialCupertinoTableindex = 0;
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: const CupertinoThemeData(
        primaryColor: Colors.black,
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
            color: Colors.black,
          ),
          pickerTextStyle: TextStyle(),
          dateTimePickerTextStyle: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: CupertinoColors.white.withOpacity(0.98),
        child: Column(
          children: [
            const SizedBox(height: 50),
            IndexedStack(
              index: initialCupertinoTableindex,
              children: const [
                productComponets(),
                searchComponets(),
                cartComponents(),
              ],
            ),
            const Spacer(),
            CupertinoTabBar(
              height: 55,
              backgroundColor: CupertinoColors.white,
              currentIndex: initialCupertinoTableindex,
              onTap: (val) {
                setState(() {
                  initialCupertinoTableindex = val;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home),
                  label: "Products",
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.search),
                  label: "Search",
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.cart_fill),
                  label: "Cart",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
