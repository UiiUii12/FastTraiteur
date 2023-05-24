import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Model/Classes/Food.dart';

class ConfirmCartController extends GetxController {
  int index=0 ;
  Color color = Colors.white ;
  List selected_items =[] ;
  List<Food> Cart=[
    Food('1111','Asset/Images/burger.jpg','Restaurant ABC','Burger','Viande hachée, frommage, Salade Vertennnnnnnnnnnnnnn',200),
    Food('2222','Asset/Images/burger.jpg','Restaurant ABC','Burger','Avec frommage,fheie',200),
    Food('3333','Asset/Images/burger.jpg','Restaurant ABC','Burger','Avec frommagesdfiuer',200),
    Food('4444','Asset/Images/burger.jpg','Restaurant ABC','Burger','Avec frommage',200),
    Food('5','Asset/Images/burger.jpg','Restaurant ABC','Burger','Avec frommage',200),
    Food('6','Asset/Images/burger.jpg','Restaurant ABC','Burger','Avec',200),
    Food('7','Asset/Images/burger.jpg','Restaurant ABC','Burger','Avec frommage',200),
  ];
  List<MultiSelectCard> supplements =[
    MultiSelectCard(value: "1" , label:'Sauce1') ,
    MultiSelectCard(value: "2" , label:'Sauce 2') ,
    MultiSelectCard(value: "3" , label:'Sauce Algerienne') ,
    MultiSelectCard(value: "4" , label:'Sauce 3') ,
    MultiSelectCard(value: "5" , label:'Sauce 4') ,
    MultiSelectCard(value: "6" , label:'Sauce 5') ,
    MultiSelectCard(value: "7" , label:'Sauce 6') ,
    MultiSelectCard(value: "8" , label:'Sauce 7') ,


  ] ;
  @override
  void onInit() {

    super.onInit();
  }

}