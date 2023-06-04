import 'dart:convert';
import 'package:fastraiteur/Model/Classes/Plat.dart';
import 'package:fastraiteur/Model/Classes/Restaurant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http ;

import '../Model/Classes/Promotion.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  final input= new TextEditingController();
 late TabController tabcontroller ;
 RxInt index = 0.obs ;

  RxList<Restaurants> restaurants = <Restaurants>[].obs;
  RxList<Plat> plats =<Plat>[].obs;
  List<Promotion> promotion = [
    Promotion("Bk Food", "Commandez 2 et obtenez 1 gratuit", "Asset/Images/promo.png") ,
    Promotion("The Twins", "Commandez 2 et obtenez 1 gratuit", "Asset/Images/promo.png") ,
    Promotion("Poulet royal", "Commandez 2 et obtenez 1 gratuit", "Asset/Images/promo.png") ,
    Promotion("Magic Pizza", "Commandez 2 et obtenez 1 gratuit", "Asset/Images/promo.png") ,
    Promotion("122", "Commandez 2 et obtenez 1 gratuit", "Asset/Images/promo.png") ,
    Promotion("Play Food", "Commandez 2 et obtenez 1 gratuit", "Asset/Images/promo.png") ,
    Promotion("Happyness", "Commandez 2 et obtenez 1 gratuit", "Asset/Images/promo.png") ,

  ] ;

  Future Search() async{

    final http.Response response = await http.post(
        Uri.parse("http://192.168.43.38:8000/recherche/") ,
        headers: <String,String>{
          'Content-Type':'application/json;charset=UTF-8'
        },
        body: jsonEncode(<String , String>{
          "q" : input.text ,
        })
    );

    if(response.statusCode >= 200 && response.statusCode < 400) {
      print("////////////////////////////////////");
      return jsonDecode(response.body);
    }
    else {
      print("0000000000000000000000000000000000000000000000");
      print(response.statusCode);
      throw Exception("Mafihaaaaaaaaaaaaaaaaaaaaaaach");
    }
  }
    getRestaurants () async {
    var response= await http.get(Uri.parse('http://192.168.43.38:8000/Restaurants/'));
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
   plats=<Plat>[].obs ;
    var response= await http.get(Uri.parse('http://192.168.43.38:8000/categorie/$category/'));
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
  void get_food_in_category (){
    tabcontroller.index == 1 ? getPlats("pizza") : tabcontroller.index == 2 ? getPlats("burger") : null ;
  }
  void inisialize(int category_length) {
    tabcontroller = TabController(
        length: category_length, vsync: this , initialIndex: 1);
  }

 @override
  void onInit() {
    inisialize(4);
    super.onInit();
    getRestaurants();
    get_food_in_category() ;

  }

}