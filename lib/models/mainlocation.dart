import 'dart:ui';

class MainLocation {
  String name;
  String icon;
  Color color;
  String imgName;
  String direction;
  List<MainLocation> subCategories;
  
  MainLocation(
      {required this.name,
      required this.icon,
      required this.color,
      required this.imgName,
      required this.subCategories,
      required this.direction,


      });
}
