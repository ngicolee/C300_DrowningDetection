import 'dart:ui';

class HomeCategory {
  String name;
  String icon;
  Color color;
  String imgName;
  List<HomeCategory> subCategories;

  HomeCategory(
      {required this.name,
      required this.icon,
      required this.color,
      required this.imgName,
      required this.subCategories});
}
