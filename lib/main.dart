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
  //
  TextStyle titleStyle = TextStyle(
    color: CupertinoColors.black.withOpacity(0.4),
    fontWeight: FontWeight.w500,
  );
  TextStyle textRightStyle = TextStyle(
    color: CupertinoColors.black.withOpacity(0.4),
  );
  TextStyle titleMaterialStyle = const TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.w700,
  );
//
  bool lockapp = true;
  bool fingerprint = false;
  bool password = true;
  bool isIos = true;

  @override
  Widget build(BuildContext context) {
    return (isIos)
        ? CupertinoApp(
            debugShowCheckedModeBanner: false,
            theme: CupertinoThemeData(
              primaryColor: Colors.black.withOpacity(0.7),
            ),
            home: CupertinoPageScaffold(
              backgroundColor: Colors.white.withOpacity(0.96),
              navigationBar: CupertinoNavigationBar(
                backgroundColor: CupertinoColors.systemRed,
                middle: const Text("Settings UI"),
                trailing: CupertinoSwitch(
                    value: isIos,
                    thumbColor: CupertinoColors.systemRed,
                    activeColor: CupertinoColors.white,
                    onChanged: (val) {
                      setState(() {
                        isIos = val;
                      });
                    }),
              ),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  headerText(name: "Common"),
                  innerContainer(
                    text: "Language",
                    subtext: "English",
                    iconFrist: CupertinoIcons.globe,
                  ),
                  innerContainer(
                    text: "Environment",
                    subtext: "Production",
                    iconFrist: CupertinoIcons.cloud,
                  ),
                  const SizedBox(height: 10),
                  headerText(name: "Account"),
                  innerContainer(
                    text: "Phone Number",
                    iconFrist: CupertinoIcons.phone,
                  ),
                  innerContainer(
                    text: "Email",
                    iconFrist: CupertinoIcons.mail_solid,
                  ),
                  innerContainer(
                    text: "Sign Out",
                    iconFrist: Icons.logout_outlined,
                  ),
                  const SizedBox(height: 10),
                  headerText(name: "Security"),
                  Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.white,
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        const Icon(
                          CupertinoIcons.lock_rotation_open,
                        ),
                        const SizedBox(width: 20),
                        const Text("Lock app in background"),
                        const Spacer(),
                        CupertinoSwitch(
                            activeColor: CupertinoColors.systemRed,
                            value: lockapp,
                            onChanged: (val) {
                              setState(() {
                                lockapp = val;
                              });
                            })
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.white,
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        const Icon(Icons.fingerprint),
                        const SizedBox(width: 20),
                        const Text("User fingerprint"),
                        const Spacer(),
                        CupertinoSwitch(
                            activeColor: CupertinoColors.systemRed,
                            value: fingerprint,
                            onChanged: (val) {
                              setState(() {
                                fingerprint = val;
                              });
                            })
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.white,
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        const Icon(
                          CupertinoIcons.lock_fill,
                        ),
                        const SizedBox(width: 20),
                        const Text("Change password"),
                        const Spacer(),
                        CupertinoSwitch(
                            activeColor: CupertinoColors.systemRed,
                            value: password,
                            onChanged: (val) {
                              setState(() {
                                password = val;
                              });
                            })
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  headerText(name: "Misc"),
                  innerContainer(
                    text: "Terms of Service",
                    iconFrist: CupertinoIcons.square_line_vertical_square,
                  ),
                  innerContainer(
                    text: "Open source Licenses",
                    iconFrist: CupertinoIcons.news,
                  )
                ],
              ),
            ),
          )
        : MaterialApp(
            theme: ThemeData(
                colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Colors.red,
              secondary: Colors.red,
            )),
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                title: const Text("Settings UI"),
                actions: [
                  Switch(
                      value: isIos,
                      onChanged: (val) {
                        setState(() {
                          isIos = val;
                        });
                      })
                ],
              ),
              body: ListView(
                children: [
                  headerMaterialText(name: "Common"),
                  innerMaterialContainer(
                    iconFrist: CupertinoIcons.globe,
                    text: "Language",
                    subtext: "English",
                  ),
                  const SizedBox(height: 1),
                  innerMaterialContainer(
                    iconFrist: CupertinoIcons.cloud,
                    text: "Environment",
                    subtext: "Production",
                  ),
                  headerMaterialText(
                    name: "Account",
                  ),
                  subMaterialContainer(
                    iconFrist: Icons.phone,
                    text: "Phone number",
                  ),
                  const SizedBox(height: 1),
                  subMaterialContainer(
                    iconFrist: Icons.email,
                    text: "Email",
                  ),
                  const SizedBox(height: 1),
                  subMaterialContainer(
                    iconFrist: Icons.logout,
                    text: "Sign out",
                  ),
                  headerMaterialText(
                    name: "Security",
                  ),
                  ListTile(
                    tileColor: Colors.white,
                    leading: const Icon(
                      Icons.send_to_mobile_rounded,
                    ),
                    title: const Text("Lock app in background"),
                    trailing: Switch(
                        thumbColor: MaterialStateProperty.all(Colors.red),
                        activeColor: Colors.red,
                        value: lockapp,
                        onChanged: (val) {
                          setState(() {
                            lockapp = val;
                          });
                        }),
                  ),
                  const SizedBox(height: 1),
                  ListTile(
                    tileColor: Colors.white,
                    leading: const Icon(
                      Icons.fingerprint_outlined,
                    ),
                    title: const Text("Use fingerprint"),
                    trailing: Switch(
                        thumbColor: MaterialStateProperty.all(Colors.red),
                        activeColor: Colors.red,
                        value: fingerprint,
                        onChanged: (val) {
                          setState(() {
                            fingerprint = val;
                          });
                        }),
                  ),
                  const SizedBox(height: 1),
                  ListTile(
                    tileColor: Colors.white,
                    leading: const Icon(
                      Icons.send_to_mobile_rounded,
                    ),
                    title: const Text("Change Password"),
                    trailing: Switch(
                        thumbColor: MaterialStateProperty.all(Colors.red),
                        activeColor: Colors.red,
                        value: password,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        }),
                  ),
                  headerMaterialText(
                    name: "Miac",
                  ),
                  subMaterialContainer(
                    iconFrist: Icons.twenty_three_mp_sharp,
                    text: "Terms of Service",
                  ),
                  subMaterialContainer(
                    iconFrist: Icons.bookmark,
                    text: "Open source licenses",
                  ),
                ],
              ),
            ),
          );
  }

  Widget headerText({required String name}) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        top: 15,
        bottom: 10,
      ),
      child: Text(
        name,
        style: titleStyle,
      ),
    );
  }

  Widget headerMaterialText({required String name}) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        top: 15,
        bottom: 10,
      ),
      child: Text(
        name,
        style: titleMaterialStyle,
      ),
    );
  }

  Widget innerContainer(
      {required String text,
      String subtext = "",
      required IconData iconFrist}) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Icon(
            iconFrist,
          ),
          const SizedBox(width: 20),
          Text(text),
          const Spacer(),
          Text(
            subtext,
            style: textRightStyle,
          ),
          const SizedBox(width: 10),
          Icon(
            CupertinoIcons.right_chevron,
            size: 20,
            color: CupertinoColors.black.withOpacity(0.4),
          )
        ],
      ),
    );
  }

  Widget innerMaterialContainer(
      {required String text,
      String subtext = "",
      required IconData iconFrist}) {
    return Container(
      height: 66,
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Icon(
            iconFrist,
          ),
          const SizedBox(width: 27),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text),
              const SizedBox(height: 4),
              Text(
                subtext,
                style: textRightStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget subMaterialContainer(
      {required String text, required IconData iconFrist}) {
    return Container(
      height: 66,
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Icon(
            iconFrist,
          ),
          const SizedBox(width: 27),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text),
            ],
          ),
        ],
      ),
    );
  }
}
