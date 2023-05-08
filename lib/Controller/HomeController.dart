import 'package:fastraiteur/Model/Classes/Category.dart';
import 'package:fastraiteur/Model/Classes/Restaurant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Model/Classes/Food.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  final input= new TextEditingController();
  late TabController tabcontroller ;
  RxInt index = 0.obs ;
  List<Restaurant> restaurant =[
    Restaurant("BK food", "Asset/Images/Rectangle 13 (4).png", "Sidi bel Abbes, Algerie",[]) ,
    Restaurant("The Twins", "Asset/Images/Rectangle 13 (1).png", "Sidi bel Abbes, Algerie",[]) ,
    Restaurant("Crunshi", "Asset/Images/Rectangle 13 (3).png", "Sidi bel Abbes, Algerie",[]) ,
    Restaurant("Play food", "Asset/Images/Rectangle 13 (1).png", "Sidi bel Abbes, Algerie",[]) ,
    Restaurant("Poulet Royal", "Asset/Images/Rectangle 13 (1).png", "Sidi bel Abbes, Algerie",[]) ,
  ];
  List<Food> plats =[
    Food('1111','Asset/Images/burger.jpg','Restaurant ABC','Burger','Avec frommage',200),
    Food('2222','Asset/Images/burger.jpg','Restaurant ABC','Burger','Avec frommage',200),
    Food('3333','Asset/Images/burger.jpg','Restaurant ABC','Burger','Avec frommage',200),
    Food('4444','Asset/Images/burger.jpg','Restaurant ABC','Burger','Avec frommage',200),
    Food('5','Asset/Images/burger.jpg','Restaurant ABC','Burger','Avec frommage',200),
    Food('6','Asset/Images/burger.jpg','Restaurant ABC','Burger','Avec frommage',200),
    Food('7','Asset/Images/burger.jpg','Restaurant ABC','Burger','Avec frommage',200),
  ];
  void inisialize(int category_length) {
    tabcontroller = TabController(
        length: category_length, vsync: this);
  }

  @override
  void onInit() {
    inisialize(4);
    super.onInit();
  }

}