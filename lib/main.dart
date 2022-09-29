// ignore_for_file: camel_case_types, non_constant_identifier_names, sort_child_properties_last

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stepper_5/Globle.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home(),
    ),
  );
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  ImagePicker image = ImagePicker();

  int initialStepVal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Your Profile"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.green.shade400,
            ],
          )),
        ),
      ),
      body: Stepper(
        physics: const BouncingScrollPhysics(),
        currentStep: initialStepVal,
        controlsBuilder: (context, details) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: (initialStepVal == 10)
                  ? const Text("Submit")
                  : const Text("Next"),
              onPressed: details.onStepContinue,
            ),
            const SizedBox(width: 20),
            (initialStepVal == 0)
                ? IconButton(
                    icon: const Icon(
                      Icons.delete,
                      size: 30,
                    ),
                    color: Colors.blue,
                    onPressed: () {
                      setState(() {
                        Globle.allSaveImage = null;
                        Globle.imageFile = null;
                        Globle.photosFile = null;
                      });
                    },
                  )
                : Container(),
            (initialStepVal == 0)
                ? Container()
                : OutlinedButton(
                    child: const Text("Cancel"),
                    onPressed: details.onStepCancel,
                  ),
          ],
        ),
        onStepTapped: (val) {
          setState(() {
            initialStepVal = val;
          });
        },
        onStepContinue: () {
          if (initialStepVal < 11) {
            setState(() {
              ++initialStepVal;
            });
          }
        },
        onStepCancel: () {
          if (initialStepVal > 0) {
            setState(() {
              --initialStepVal;
            });
          }
        },
        steps: [
          Step(
            title: const Text("Profile Picture"),
            isActive: (initialStepVal >= 0) ? true : false,
            content: Container(
              height: 150,
              width: 150,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    maxRadius: 60,
                    backgroundColor: Colors.grey[400],
                    backgroundImage: (Globle.cameraPhoto)
                        ? (Globle.imageFile != null)
                            ? FileImage(Globle.imageFile!)
                            : null
                        : (Globle.photosFile != null)
                            ? FileImage(Globle.photosFile!)
                            : null,
                    child: (Globle.cameraPhoto)
                        ? (Globle.imageFile == null)
                            ? const Text(
                                "ADD",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25,
                                ),
                              )
                            : null
                        : (Globle.photosFile == null)
                            ? const Text(
                                "ADD",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25,
                                ),
                              )
                            : null,
                  ),
                  Positioned(
                    left: 93,
                    top: 87,
                    child: FloatingActionButton(
                      elevation: 0,
                      mini: true,
                      child: const Icon(
                        Icons.add,
                        size: 25,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                30,
                              ),
                              side: BorderSide(
                                color: Colors.blue.shade800,
                                width: 3,
                              ),
                            ),
                            title: const Center(
                              child: Text("Select Ones"),
                            ),
                            actionsAlignment: MainAxisAlignment.spaceAround,
                            actions: [
                              Column(
                                children: [
                                  ElevatedButton(
                                    child: const Icon(
                                      Icons.camera,
                                    ),
                                    onPressed: () async {
                                      Globle.cameraPhoto = false;
                                      XFile? Gallery = await image.pickImage(
                                        source: ImageSource.camera,
                                      );
                                      setState(() {
                                        Globle.photosFile = File(Gallery!.path);
                                        Globle.allSaveImage = Globle.photosFile;
                                        Navigator.of(context).pop();
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 2),
                                  const Text(
                                    "Camera",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  ElevatedButton(
                                    child: const Icon(
                                      Icons.photo_library_sharp,
                                    ),
                                    onPressed: () async {
                                      Globle.cameraPhoto = true;
                                      XFile? Photo = await image.pickImage(
                                        source: ImageSource.gallery,
                                      );

                                      setState(() {
                                        Globle.imageFile = File(Photo!.path);
                                        Globle.allSaveImage = Globle.imageFile;
                                        Navigator.of(context).pop();
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 2),
                                  const Text(
                                    "Gallery",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Step(
            title: const Text("Name"),
            isActive: (initialStepVal >= 1) ? true : false,
            content: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Your Full Name.",
              ),
            ),
          ),
          Step(
            title: const Text("Phone"),
            isActive: (initialStepVal >= 2) ? true : false,
            content: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Phone No",
              ),
            ),
          ),
          Step(
            title: const Text("Email"),
            isActive: (initialStepVal >= 3) ? true : false,
            content: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Email",
              ),
            ),
          ),
          Step(
            title: const Text("DOB"),
            isActive: (initialStepVal >= 4) ? true : false,
            content: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "DD/MM/YYYY",
              ),
            ),
          ),
          Step(
            title: const Text("Gender"),
            isActive: (initialStepVal >= 5) ? true : false,
            content: Column(
              children: [
                RadioListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    "Male",
                  ),
                  value: "Male",
                  groupValue: Globle.malefemale,
                  onChanged: (val) {
                    setState(() {
                      Globle.malefemale = val;
                    });
                  },
                ),
                RadioListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    "Female",
                  ),
                  value: "Female",
                  groupValue: Globle.malefemale,
                  onChanged: (val) {
                    setState(() {
                      Globle.malefemale = val;
                    });
                  },
                ),
              ],
            ),
          ),
          Step(
            title: const Text("Current Loction"),
            isActive: (initialStepVal >= 6) ? true : false,
            content: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Your Location",
              ),
            ),
          ),
          Step(
            title: const Text("Nationalities"),
            isActive: (initialStepVal >= 7) ? true : false,
            content: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Your Nationalities",
              ),
            ),
          ),
          Step(
            title: const Text("Religion"),
            isActive: (initialStepVal >= 8) ? true : false,
            content: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Your Religion",
              ),
            ),
          ),
          Step(
            title: const Text("Language(s)"),
            isActive: (initialStepVal >= 9) ? true : false,
            content: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Your Language",
              ),
            ),
          ),
          Step(
            title: const Text("Biography"),
            isActive: (initialStepVal >= 10) ? true : false,
            content: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Your Biography",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
