// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, prefer_interpolation_to_compose_strings, avoid_print, avoid_unnecessary_containers, unused_label, unused_local_variable

import 'dart:async';

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/models/usermodel.dart';
import 'package:c300drowningdetection/pages/guesthomepage.dart';
import 'package:c300drowningdetection/pages/guestlistitempage.dart';
import 'package:c300drowningdetection/widgets/drowncheck.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:slide_to_act/slide_to_act.dart';

class CurrentDatePage extends StatefulWidget {
  const CurrentDatePage({Key? key}) : super(key: key);

  @override
  State<CurrentDatePage> createState() => _CurrentDatePageState();
}

class _CurrentDatePageState extends State<CurrentDatePage> {
  double screenHeight = 0;
  double screenWidth = 0;

  String email = " ";
  String userName = " ";
  String userRights = " ";
  String userId = " ";
  String userPhoneNumber = " ";

  String checkIn = "--/--";
  String checkOut = "--/--";
  String location = " ";
  String scanResult = " ";
  String poolQRCode = " ";

  User? currentUser = FirebaseAuth.instance.currentUser;

  bool loadPage = false;

  Future<void> scanQRandCheck() async {
    String result = " ";
    try {
      result = await FlutterBarcodeScanner.scanBarcode(
          '#ffffff', "Cancel QR Code", false, ScanMode.QR);
    } catch (e) {
      print("Error");
    }
    setState(() {
      scanResult = result;
    });

    if (scanResult == poolQRCode) {
      if (UserModel.lat != 0) {
        _getLocation();

        QuerySnapshot<Map<String, dynamic>> snap = await FirebaseFirestore
            .instance
            .collection("users")
            .where("userId", isEqualTo: userId)
            .get();
        for (var element in snap.docs) {
          if (currentUser?.uid == element.data()["userId"]) {
            userId = element.data()["userId"];
          }
        }

        DocumentSnapshot docSnap = await FirebaseFirestore.instance
            .collection("users")
            .doc(snap.docs[0].id)
            .collection("record")
            .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
            .get();

        try {
          String checkIn = docSnap['checkIn'];

          setState(() {
            checkOut = DateFormat('hh:mm').format(DateTime.now());
          });
          await FirebaseFirestore.instance
              .collection("users")
              .doc(snap.docs[0].id)
              .collection("record")
              .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
              .update(
            {
              'checkIn': checkIn,
              'date': Timestamp.now(),
              'checkOut': DateFormat('hh:mm').format(DateTime.now()),
              'checkOutLocation': location,
            },
          );
        } catch (e) {
          setState(() {
            checkIn = DateFormat('hh:mm').format(DateTime.now());
          });
          await FirebaseFirestore.instance
              .collection("users")
              .doc(snap.docs[0].id)
              .collection("record")
              .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
              .set(
            {
              'checkIn': DateFormat('hh:mm').format(
                DateTime.now(),
              ),
              'date': Timestamp.now(),
              'checkOut': "--/--",
              'checkInLocation': location,
            },
          );
        }
      } else {
        Timer(
          Duration(seconds: 3),
          () async {
            if (UserModel.lat != 0) {
              _getLocation();

              QuerySnapshot<Map<String, dynamic>> snap = await FirebaseFirestore
                  .instance
                  .collection("users")
                  .where("userId", isEqualTo: userId)
                  .get();
              for (var element in snap.docs) {
                if (currentUser?.uid == element.data()["userId"]) {
                  userId = element.data()["userId"];
                }
              }

              DocumentSnapshot docSnap = await FirebaseFirestore.instance
                  .collection("users")
                  .doc(snap.docs[0].id)
                  .collection("record")
                  .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
                  .get();

              try {
                String checkIn = docSnap['checkIn'];

                setState(() {
                  checkOut = DateFormat('hh:mm').format(DateTime.now());
                });
                await FirebaseFirestore.instance
                    .collection("users")
                    .doc(snap.docs[0].id)
                    .collection("record")
                    .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
                    .update(
                  {
                    'checkIn': checkIn,
                    'date': Timestamp.now(),
                    'checkOut': DateFormat('hh:mm').format(DateTime.now()),
                    'checkOutLocation': location,
                  },
                );
              } catch (e) {
                setState(() {
                  checkIn = DateFormat('hh:mm').format(DateTime.now());
                });
                await FirebaseFirestore.instance
                    .collection("users")
                    .doc(snap.docs[0].id)
                    .collection("record")
                    .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
                    .set(
                  {
                    'checkIn': DateFormat('hh:mm').format(
                      DateTime.now(),
                    ),
                    'date': Timestamp.now(),
                    'checkOut': "--/--",
                    'checkInLocation': location,
                  },
                );
              }
            }
          },
        );
      }
    }
  }

  void _getPoolQRCode() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection("attributes")
        .doc("Swimming Pool 1")
        .get();

    setState(() {
      poolQRCode = snap['qrcode'];
    });
  }

  void _getLocation() async {
    List<Placemark> placeMark =
        await placemarkFromCoordinates(UserModel.lat, UserModel.long);
    setState(() {
      location =
          "${placeMark[0].street}, ${placeMark[0].postalCode}, ${placeMark[0].country}";
    });
  }

  Future<String> getUserName() async {
    QuerySnapshot<Map<String, dynamic>> snap =
        await FirebaseFirestore.instance.collection("users").get();
    for (var element in snap.docs) {
      if (currentUser?.uid == element.data()["userId"]) {
        userName = element.data()["userName"];
      }
    }

    return userName;
  }

  Future<String> getUserId() async {
    QuerySnapshot<Map<String, dynamic>> snap =
        await FirebaseFirestore.instance.collection("users").get();
    for (var element in snap.docs) {
      if (currentUser?.uid == element.data()["userId"]) {
        userId = element.data()["userId"];
      }
    }

    return userId;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _getRecords());
    DrownCheck().drownCheck;
    _getPoolQRCode();
  }

  void _getRecords() async {
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection("users")
          .where("userId", isEqualTo: userId)
          .get();

      DocumentSnapshot docSnap = await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection("record")
          .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
          .get();
      setState(() {
        checkIn = docSnap["checkIn"];
        checkOut = docSnap["checkOut"];
      });
    } catch (e) {
      setState(() {
        checkIn = "--/--";
        checkOut = "--/--";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    getUserId();
    getUserName();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lifeguard Attendance",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColors.MAIN_COLOR,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => GuestListItemsPage(
                  snapShot: guestfeaturedSnapshot,
                  appbarName: 'Featured Page',
                  name: 'Featured Page',
                ),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                "Welcome",
                style:
                    TextStyle(color: Colors.black, fontSize: screenWidth / 20),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Lifeguard " + userName,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth / 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                "Today's Status",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth / 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 150,
              margin: EdgeInsets.only(top: 12, bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.MAIN_COLOR,
                    blurRadius: 10,
                    offset: Offset(2, 2),
                  ),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check In",
                          style: TextStyle(
                              fontSize: screenWidth / 20, color: Colors.black),
                        ),
                        Text(
                          checkIn,
                          style: TextStyle(
                              fontSize: screenWidth / 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check Out",
                          style: TextStyle(
                              fontSize: screenWidth / 20, color: Colors.black),
                        ),
                        Text(
                          checkOut,
                          style: TextStyle(
                              fontSize: screenWidth / 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: DateTime.now().day.toString(),
                  style: TextStyle(
                      color: AppColors.MAIN_COLOR,
                      fontSize: screenWidth / 18,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: DateFormat(' MMM yyyy').format(
                        DateTime.now(),
                      ),
                      style: TextStyle(
                          color: Colors.black, fontSize: screenWidth / 20),
                    ),
                  ],
                ),
              ),
            ),
            StreamBuilder(
                stream: Stream.periodic(
                  const Duration(seconds: 1),
                ),
                builder: (context, snapshot) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      DateFormat('hh:mm:ss a').format(
                        DateTime.now(),
                      ),
                      style: TextStyle(
                        fontSize: screenWidth / 20,
                        color: Colors.black,
                      ),
                    ),
                  );
                }),
            checkOut == "--/--"
                ? Container(
                    margin: const EdgeInsets.only(top: 12, bottom: 22),
                    child: Builder(
                      builder: (context) {
                        final GlobalKey<SlideActionState> slideKey =
                            GlobalKey();

                        return SlideAction(
                          text: checkIn == "--/--"
                              ? "Slide to Check In"
                              : "Slide to Check Out",
                          innerColor: AppColors.MAIN_COLOR,
                          outerColor: Colors.white,
                          textStyle: TextStyle(
                            color: AppColors.MAIN_COLOR,
                            fontSize: screenWidth / 18,
                          ),
                          key: slideKey,
                          onSubmit: () async {
                            if (UserModel.lat != 0) {
                              _getLocation();

                              QuerySnapshot<Map<String, dynamic>> snap =
                                  await FirebaseFirestore.instance
                                      .collection("users")
                                      .where("userId", isEqualTo: userId)
                                      .get();
                              for (var element in snap.docs) {
                                if (currentUser?.uid ==
                                    element.data()["userId"]) {
                                  userId = element.data()["userId"];
                                }
                              }

                              DocumentSnapshot docSnap = await FirebaseFirestore
                                  .instance
                                  .collection("users")
                                  .doc(snap.docs[0].id)
                                  .collection("record")
                                  .doc(DateFormat('dd MMMM yyyy')
                                      .format(DateTime.now()))
                                  .get();

                              try {
                                String checkIn = docSnap['checkIn'];

                                setState(() {
                                  checkOut = DateFormat('hh:mm')
                                      .format(DateTime.now());
                                });
                                await FirebaseFirestore.instance
                                    .collection("users")
                                    .doc(snap.docs[0].id)
                                    .collection("record")
                                    .doc(DateFormat('dd MMMM yyyy')
                                        .format(DateTime.now()))
                                    .update(
                                  {
                                    'checkIn': checkIn,
                                    'date': Timestamp.now(),
                                    'checkOut': DateFormat('hh:mm')
                                        .format(DateTime.now()),
                                    'checkOutLocation': location,
                                  },
                                );
                              } catch (e) {
                                setState(() {
                                  checkIn = DateFormat('hh:mm')
                                      .format(DateTime.now());
                                });
                                await FirebaseFirestore.instance
                                    .collection("users")
                                    .doc(snap.docs[0].id)
                                    .collection("record")
                                    .doc(DateFormat('dd MMMM yyyy')
                                        .format(DateTime.now()))
                                    .set(
                                  {
                                    'checkIn': DateFormat('hh:mm').format(
                                      DateTime.now(),
                                    ),
                                    'date': Timestamp.now(),
                                    'checkOut': "--/--",
                                    'checkInLocation': location,
                                  },
                                );
                              }

                              slideKey.currentState?.reset();
                            } else {
                              Timer(
                                Duration(seconds: 3),
                                () async {
                                  if (UserModel.lat != 0) {
                                    _getLocation();

                                    QuerySnapshot<Map<String, dynamic>> snap =
                                        await FirebaseFirestore.instance
                                            .collection("users")
                                            .where("userId", isEqualTo: userId)
                                            .get();
                                    for (var element in snap.docs) {
                                      if (currentUser?.uid ==
                                          element.data()["userId"]) {
                                        userId = element.data()["userId"];
                                      }
                                    }

                                    DocumentSnapshot docSnap =
                                        await FirebaseFirestore.instance
                                            .collection("users")
                                            .doc(snap.docs[0].id)
                                            .collection("record")
                                            .doc(DateFormat('dd MMMM yyyy')
                                                .format(DateTime.now()))
                                            .get();

                                    try {
                                      String checkIn = docSnap['checkIn'];

                                      setState(() {
                                        checkOut = DateFormat('hh:mm')
                                            .format(DateTime.now());
                                      });
                                      await FirebaseFirestore.instance
                                          .collection("users")
                                          .doc(snap.docs[0].id)
                                          .collection("record")
                                          .doc(DateFormat('dd MMMM yyyy')
                                              .format(DateTime.now()))
                                          .update(
                                        {
                                          'checkIn': checkIn,
                                          'date': Timestamp.now(),
                                          'checkOut': DateFormat('hh:mm')
                                              .format(DateTime.now()),
                                          'checkOutLocation': location,
                                        },
                                      );
                                    } catch (e) {
                                      setState(() {
                                        checkIn = DateFormat('hh:mm')
                                            .format(DateTime.now());
                                      });
                                      await FirebaseFirestore.instance
                                          .collection("users")
                                          .doc(snap.docs[0].id)
                                          .collection("record")
                                          .doc(DateFormat('dd MMMM yyyy')
                                              .format(DateTime.now()))
                                          .set(
                                        {
                                          'checkIn': DateFormat('hh:mm').format(
                                            DateTime.now(),
                                          ),
                                          'date': Timestamp.now(),
                                          'checkOut': "--/--",
                                          'checkInLocation': location,
                                        },
                                      );
                                    }

                                    slideKey.currentState?.reset();
                                  }
                                },
                              );
                            }
                          },
                        );
                      },
                    ),
                  )
                : Container(
                    width: screenWidth,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.MAIN_COLOR,
                          offset: Offset(2, 2),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(top: 32, bottom: 12),
                    child: Center(
                      child: Text(
                        "Completed Today's Attendance",
                        style: TextStyle(
                            color: AppColors.MAIN_COLOR,
                            fontSize: screenWidth / 20),
                      ),
                    ),
                  ),
            location != " "
                ? Text(
                    "Location: " + location,
                    style: TextStyle(
                      color: AppColors.MAIN_COLOR,
                    ),
                  )
                : const SizedBox(),
            SizedBox(
              height: 10,
            ),
            checkOut == "--/--"
                ? GestureDetector(
                    onTap: () {
                      scanQRandCheck();
                    },
                    child: Container(
                      height: screenWidth / 2.5,
                      width: screenWidth / 2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.MAIN_COLOR,
                            offset: Offset(2, 2),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(Icons.crop_square_rounded,
                                  size: 65, color: AppColors.MAIN_COLOR),
                              Icon(Icons.camera_alt_rounded,
                                  size: 25, color: AppColors.MAIN_COLOR),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(
                              checkIn == "--/--"
                                  ? "Scan to Check In"
                                  : "Scan to Check Out",
                              style: TextStyle(
                                  color: AppColors.MAIN_COLOR,
                                  fontSize: screenWidth / 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
