import 'dart:convert';
import 'package:fastraiteur/Model/Classes/Plat.dart';
import 'package:fastraiteur/Model/Classes/Restaurant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  final input= new TextEditingController();
 late TabController tabcontroller ;
 RxInt index = 0.obs ;

  RxList<Restaurants> restaurants = <Restaurants>[].obs;
  RxList<Plat> plats =<Plat>[].obs;
    getRestaurants () async {
    var response= await get(Uri.parse('http://192.168.43.38:8000/Restaurants/'));
    if (response.statusCode >= 200 && response.statusCode < 400) {
      print(response.body);
      var jsonResponse =json.decode(response.body);

      for (var restaurant in jsonResponse) {

        restaurants.add(Restaurants.fromJson(restaurant)) ;

      }

    }
    else print("Faileeeeeeeeeeeeeeeeeeeeeeeeeed");
  }
   getPlats (String category) async {

    var response= await get(Uri.parse('http://192.168.43.38:8000/categorie/$category/'));
    if (response.statusCode >= 200 && response.statusCode < 400) {
      print(response.body);
      var jsonResponse =json.decode(response.body);

      for (var plat in jsonResponse) {
        print(plat);

        plats.add(Plat.fromJson(plat)) ;

      }


    }
    else print("Faileeeeeeeeeeeeeeeeeeeeeeeeeed");
  }
  List<Plat> plat (String category) {

      print(plats.length);
      getPlats(category);
      print(plats.length);
      return plats ;


  }

  void inisialize(int category_length) {
    tabcontroller = TabController(
        length: category_length, vsync: this);
  }

 @override
  void onInit() {
    inisialize(4);
    super.onInit();
    getRestaurants();

  }

}