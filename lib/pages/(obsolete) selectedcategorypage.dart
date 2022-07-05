// ignore_for_file: avoid_unnecessary_containers, use_key_in_widget_constructors, must_be_immutable, unnecessary_this

import 'package:c300drowningdetection/models/homecategory.dart';
import 'package:c300drowningdetection/models/subcategory.dart';
import 'package:c300drowningdetection/pages/(obsolete)%20streamingpage.dart';
import 'package:c300drowningdetection/widgets/(obsolete)%20mainappbar.dart';
import 'package:c300drowningdetection/widgets/locationicons.dart';
import 'package:flutter/material.dart';

class SelectedCategoryPage extends StatelessWidget {
  HomeCategory selectedCategory;
  SelectedCategoryPage({required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(),
        body: Container(
            child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LocationIcons(
                  color: this.selectedCategory.color,
                  iconName: this.selectedCategory.icon),
              const SizedBox(width: 10),
              Text(this.selectedCategory.name,
                  style: TextStyle(
                      color: this.selectedCategory.color, fontSize: 20))
            ],
          ),
          const SizedBox(height: 30),
          Expanded(
              child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(
                      this.selectedCategory.subCategories.length, (index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StreamingPage(
                                      subCategory: this
                                              .selectedCategory
                                              .subCategories[index]
                                          as SubCategory)));
                        },
                        child: Container(
                            child: Column(children: [
                          ClipOval(
                              child: Image.asset(
                                  'assets/imgs/' +
                                      this
                                          .selectedCategory
                                          .subCategories[index]
                                          .imgName +
                                      '.png',
                                  fit: BoxFit.cover,
                                  width: 150,
                                  height: 150)),
                          const SizedBox(height: 5),
                          Text(this.selectedCategory.subCategories[index].name,
                              style:
                                  TextStyle(color: this.selectedCategory.color))
                        ])));
                  })))
        ])));
  }
}
