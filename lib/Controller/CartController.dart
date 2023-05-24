import 'dart:ffi';

import 'package:fastraiteur/Model/Classes/Food.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  List<Food> Cart=[
    Food('1111','Asset/Images/burger.jpg','Restaurant ABC','Burger','Viande hachée, frommage, Salade Vert',200),
    Food('2222','Asset/Images/burger.jpg','Restaurant ABC','Burger','Avec frommage,fheie',200),
    Food('3333','Asset/Images/burger.jpg','Restaurant ABC','Burger','Avec frommagesdfiuer',200),
    Food('4444','Asset/Images/burger.jpg','Restaurant ABC','Burger','Avec frommage',200),
    Food('5','Asset/Images/burger.jpg','Restaurant ABC','Burger','Avec frommage',200),
    Food('6','Asset/Images/burger.jpg','Restaurant ABC','Burger','Avec',200),
    Food('7','Asset/Images/burger.jpg','Restaurant ABC','Burger','Avec frommage',200),
  ];
  removeFromCart(List<Food>cart,int index){
    cart.removeAt(index);
    update();
  }
}