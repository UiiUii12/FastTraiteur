import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Model/Classes/Food.dart';

class SearchController extends GetxController{
  final searchInput= new TextEditingController();
  final List<Food> plats = [
    Food('1111','Asset/Images/burger.jpg','Restaurant ABC','Burger','Avec frommage',200),
    Food('2222','Asset/Images/burger.jpg','Restaurant ABC','Burger','Avec frommage',200),
    Food('3333','Asset/Images/burger.jpg','Restaurant ABC','Burger','Avec frommage',200),
    Food('4444','Asset/Images/burger.jpg','Restaurant ABC','Burger','Avec frommage',200),
    Food('5','Asset/Images/burger.jpg','Restaurant ABC','Burger','Avec frommage',200),
    Food('6','Asset/Images/burger.jpg','Restaurant ABC','Burger','Avec frommage',200),
    Food('7','Asset/Images/burger.jpg','Restaurant ABC','Burger','Avec frommage',200),

  ];
}