// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/pages/listitempage.dart';
import 'package:c300drowningdetection/pages/mainhomepage.dart';
import 'package:c300drowningdetection/widgets/buttonswidget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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

  @override
  Widget build(BuildContext context) {
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
        leading: 
        edit == true
            ? IconButton(
                icon: Icon(Icons.close, color: Colors.white, size: 30),
                onPressed: () {
                  setState(() {
                    edit = false;
                  });
                },
              )
            : Container(),
            
        actions: [
          edit == false
              ? Container()
              : IconButton(
                  icon: Icon(
                    Icons.check,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => ListItemsPage(
                          appbarName: 'Featured Page',
                          snapShot: featuredSnapshot,
                          name: 'Featured',
                        ),
                      ),
                    );
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
                        backgroundImage:
                            AssetImage("assets/imgs/TestProfilePicture.png"),
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
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child:
                                Icon(Icons.edit, color: AppColors.MAIN_COLOR),
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
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildSingleTextField(
                                name: "Dexter Chua",
                              ),
                              _buildSingleTextField(
                                name: "dchua647@gmail.com",
                              ),
                              _buildSingleTextField(
                                name: "Male",
                              ),
                              _buildSingleTextField(
                                name: "81621630",
                              ),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildSingleCont(
                                  label: "Name:", dataText: "Dexter Chua"),
                              _buildSingleCont(
                                  label: "Email:",
                                  dataText: "dchua647@gmail.com"),
                              _buildSingleCont(
                                  label: "Gender:", dataText: "Male"),
                              _buildSingleCont(
                                  label: "Phone Number:", dataText: "81621630"),
                            ],
                          ),
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
                        btnName: "Edit Profile",
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
