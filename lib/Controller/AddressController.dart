import 'package:fastraiteur/Model/Classes/Category.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AddressController extends GetxController {
 final address = TextEditingController();
 List<Category>catgories=[
  Category('Burger', 'Asset/Images/burgerIcon.svg',[] ),
  Category('Pizza', 'Asset/Images/pizzaIcon.svg', []),
  Category('Soup', 'Asset/Images/soupIcon.svg',[] ),
 ];
}