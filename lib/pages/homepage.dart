// ignore_for_file: avoid_unnecessary_containers, use_key_in_widget_constructors, unnecessary_this

import 'package:c300drowningdetection/helpers/utils.dart';
import 'package:c300drowningdetection/models/homecategory.dart';
import 'package:c300drowningdetection/pages/selectedcategorypage.dart';
import 'package:c300drowningdetection/widgets/categorybtmbar.dart';
import 'package:c300drowningdetection/widgets/categorypages.dart';
import 'package:c300drowningdetection/widgets/mainappbar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {

  List<HomeCategory> categories = Utils.getCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(),
        appBar: MainAppBar(),
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
                                    SelectedCategoryPage(selectedCategory: this.categories[index],)));
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
