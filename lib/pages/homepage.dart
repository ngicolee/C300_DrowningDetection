// ignore_for_file: avoid_unnecessary_containers

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/helpers/iconhelper.dart';
import 'package:c300drowningdetection/helpers/utils.dart';
import 'package:c300drowningdetection/models/homecategory.dart';
import 'package:c300drowningdetection/pages/selectedcategorypage.dart';
import 'package:c300drowningdetection/widgets/categorybtmbar.dart';
import 'package:c300drowningdetection/widgets/categorypages.dart';
import 'package:c300drowningdetection/widgets/iconfont.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  List<HomeCategory> categories = Utils.getCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
            title: IconFont(
                iconName: IconFontHelper.APP_ICON,
                color: AppColors.MAIN_COLOR,
                size: 50),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
            iconTheme: const IconThemeData(color: AppColors.MAIN_COLOR),
            actions: [
              Container(
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.all(10),
                  child: ClipOval(child: Image.asset('assets/imgs/Sample.png')))
            ]),
        body: Container(
            child: Stack(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text('Select Your Page',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black)),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 70),
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return CategoryPages(
                      category: categories[index],
                      onCardClick: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SelectedCategoryPage()));
                      });
                  // Required to Navigate to Another Page
                },
              ),
            )
          ]),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CategoryBtmBar(),
          )
        ])));
  }
}
