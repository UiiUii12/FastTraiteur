import 'dart:convert';
import 'package:collection/collection.dart' ;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart';
import '../Model/Classes/Plat.dart';

class RestaurantController extends GetxController with GetTickerProviderStateMixin {

   RxList<Plat> plats = <Plat>[

  ].obs;
   RxList<String> categorie =<String>[].obs;
   RxMap<String ,List<Plat>> list= <String ,List<Plat>>{}.obs ;

  late TabController tabController;

  getPlats (String restaurant_name) async {
    plats=<Plat>[].obs;
    var response= await get(Uri.parse('http://192.168.43.38:8000/restaurants/${restaurant_name}/plats/'));
    if (response.statusCode >= 200 && response.statusCode < 400) {

      var jsonResponse =json.decode(response.body);
print(response.body);
      for (var plat in jsonResponse) {
        plats.add(Plat.fromJson(plat)) ;

      }
      list = groupBy(plats, (Plat food) {
        return food.categorie ;
      }
      ).obs;
      categorie = list.keys.toList().obs ;
      print(list);
      print(categorie);
      inisialize(categorie.length);

    }
    else print("Faileeeeeeeeeeeeeeeeeeeeeeeeeed");
  }



  void inisialize(int category_length) {
    tabController = TabController(
        length: category_length, vsync: this);
  }
  RxList<Widget> tabs() {

    RxList<Widget> tb = <Widget>[].obs;
    for (String category in categorie)
      (tb.add(
        Container(
          height:38.h ,
          width: 91.w,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             // SvgPicture.asset(category.icon),
              SizedBox(width: 10.w,),
              AutoSizeText(category,style: TextStyle(fontWeight:FontWeight.w600 ,fontSize:14.sp ,color: Colors.white),)
            ],
          ),
        )
      ));
    print(tb);
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