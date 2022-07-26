// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, unused_field, prefer_const_constructors_in_immutables, unnecessary_null_comparison

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/models/usermodel.dart';
import 'package:c300drowningdetection/pages/guesthomepage.dart';
import 'package:c300drowningdetection/pages/mainhomepage.dart';
import 'package:c300drowningdetection/provider/page_provider.dart';
import 'package:c300drowningdetection/widgets/buttonswidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  PageProvider? pageProvider;
  File ?_pickedImage;
  XFile? _image;
  Future<void> getImage({required ImageSource source}) async {
    _image = (await ImagePicker().pickImage(source: source))!;
    if (_image != null) {
      _pickedImage = File(_image!.path);
    }
  }

  String? imageUrl;
  void _imageUpload({required File image}) async {
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("UserImage/${user?.uid}");
    UploadTask uploadTask = ref.putFile(image);
    uploadTask.then((res) {
      res.ref.getDownloadURL();
    });
  }

  String userRights = "Guest";

  @override
  void initState() {
    super.initState();
    _checkRole();
  }

  void _checkRole() async {
    User? user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get();

    setState(() {
      userRights = snap["userRights"];
    });
  }

  Widget _buildSingleCont({required String label, required String dataText}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            Text(
              dataText,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSingleTextField({required String name}) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: name,
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  bool edit = false;

  Widget _buildContainer() {
    List<UserModel> userModel = pageProvider!.userList;
    return Column(
      children: userModel.map((e) {
        return Container(
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSingleCont(label: "Username:", dataText: e.userName),
              _buildSingleCont(label: "Email:", dataText: e.userEmail),
              _buildSingleCont(label: "Gender:", dataText: e.userGender),
              _buildSingleCont(
                  label: "Phone Number:", dataText: e.userPhoneNumber),
            ],
          ),
        );
      }).toList(),
    );
  }

  Future<void> alertDialog() {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  ListTile(
                    leading: Icon(Icons.camera_alt),
                    title: Text("Take Photo"),
                    onTap: () {
                      getImage(source: ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text("Obtain Image from Gallery"),
                    onTap: () {
                      getImage(source: ImageSource.gallery);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildTextFormField() {
    List<UserModel> userModel = pageProvider!.userList;
    return Column(
      children: userModel.map((e) {
        return Container(
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSingleTextField(
                name: e.userName,
              ),
              _buildSingleTextField(
                name: e.userEmail,
              ),
              _buildSingleTextField(
                name: e.userGender,
              ),
              _buildSingleTextField(
                name: e.userPhoneNumber,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    pageProvider = Provider.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Profile Page",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColors.MAIN_COLOR,
        elevation: 0.0,
        leading: edit == true
            ? IconButton(
                icon: Icon(Icons.close, color: Colors.white, size: 30),
                onPressed: () {
                  setState(() {
                    edit = false;
                  });
                },
              )
            : IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
                onPressed: () {
                  if (userRights == "Admin") {
                    setState(() {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => MainHomePage(),
                        ),
                      );
                    });
                  } else if (userRights == "Guest") {
                    setState(() {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => GuestHomePage(),
                        ),
                      );
                    });
                  }
                },
              ),
        actions: [
          edit == false
              ? Container()
              : IconButton(
                  icon: Icon(
                    Icons.check,
                    size: 30,
                  ),
                  onPressed: () {
                    _imageUpload(image: _pickedImage!);
                    setState(() {
                      edit = false;
                    });
                  },
                ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              children: [
                Container(
                  height: 130,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        maxRadius: 65,
                        backgroundImage: _pickedImage == null
                            ? AssetImage("assets/imgs/ProfilePicture.jpg")
                            : FileImage(_pickedImage!) as ImageProvider,
                      ),
                    ],
                  ),
                ),
                edit == true
                    ? Padding(
                        padding: const EdgeInsets.only(left: 220, top: 80),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              alertDialog();
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: Icon(Icons.camera_alt,
                                  color: AppColors.MAIN_COLOR),
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            Container(
              height: 300,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 300,
                    child: edit == true
                        ? _buildContainer()
                        : _buildContainer(),
                  ),
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: edit == false
                    ? ButtonsWidget(
                        btnName: "Upload Profile Picture",
                        onPressed: () {
                          setState(() {
                            edit = true;
                          });
                        },
                      )
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
