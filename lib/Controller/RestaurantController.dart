import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../Model/Classes/Category.dart';
import '../Model/Classes/Food.dart';
import '../Model/Classes/Restaurant.dart';

class RestaurantController extends GetxController with GetTickerProviderStateMixin {

  final List<Food> plats = [
    Food('1111','Asset/Images/burger.jpg','Restaurant ABC','Burger','Avec frommage',200),
    Food('2222','Asset/Images/burger.jpg','Restaurant ABC','Burger','Avec frommage',200),
    Food('3333','Asset/Images/burger.jpg','Restaurant ABC','Burger','Avec frommage',200),
    Food('4444','Asset/Images/burger.jpg','Restaurant ABC','Burger','Avec frommage',200),
    Food('5','Asset/Images/burger.jpg','Restaurant ABC','Burger','Avec frommage',200),
    Food('6','Asset/Images/burger.jpg','Restaurant ABC','Burger','Avec frommage',200),
    Food('7','Asset/Images/burger.jpg','Restaurant ABC','Burger','Avec frommage',200),

  ];
  late TabController tabController;
  List<Restaurant> restaurant =[
    Restaurant("BK food", "Asset/Images/Rectangle 13.png", "Sidi bel Abbes, Algerie",[]) ,
    Restaurant("The Twins", "Asset/Images/Rectangle 13 (1).png", "Sidi bel Abbes, Algerie",[]) ,
    Restaurant("Crunshi", "Asset/Images/Rectangle 13.png", "Sidi bel Abbes, Algerie",[]) ,
    Restaurant("Play food", "Asset/Images/Rectangle 13 (1).png", "Sidi bel Abbes, Algerie",[]) ,
    Restaurant("Poulet Royal", "Asset/Images/Rectangle 13 (1).png", "Sidi bel Abbes, Algerie",[]) ,
  ];
  void inisialize(int category_length, int selected_item) {
    tabController = TabController(
        length: category_length, vsync: this, initialIndex: selected_item);
  }
  List<Widget> tabs(List<Category> cat) {
    List<Widget> tb = [];
    for (Category category in cat)
      (tb.add(
        Container(
          height:38.h ,
          width: 91.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
            color: Color(0XFFFFFFFF),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(category.icon),
              SizedBox(width: 10.w,),
              AutoSizeText(category.name,style: TextStyle(fontWeight:FontWeight.w600 ,fontSize:14.sp ,color: Colors.white),)
            ],
          ),
        )
      ));
    return tb;
  }
  @override
  void onInit() {
    super.onInit();

  }
  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}