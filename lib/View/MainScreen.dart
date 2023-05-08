
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fastraiteur/Controller/MainScreenController.dart';
import 'package:fastraiteur/View/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';



class MainScreen extends StatelessWidget {

  MainScreen({Key? key,  }) : super(key: key);

  MainScreenController controller= Get.put(MainScreenController(),permanent: true);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> history=
    [
      {"index" :controller.Home_previous, "Screen" : HomeScreen()},
      {"index":controller.Search_previous, "Screen" :HomeScreen()} ,
      {"index" :controller.Cart_previous, "Screen":HomeScreen()},
      {"index":controller.MesCommandes_previous,"Screen":HomeScreen()}
    ];

    return
      WillPopScope(
          onWillPop: () async{


            print(controller.currentindex);
            print(history[controller.currentindex.value]["index"]);
            print('///////////////////////////////');
            controller.currentindex.value=history[controller.currentindex.value]["index"];
            print('///////////////////////////////');
            print(controller.currentindex);


            return false;
          },
          child: SafeArea(child:
          GetX<MainScreenController>(

              builder: (controller) =>
                  Scaffold(
                    body:
                    history[controller.currentindex.value]["Screen"],

                    bottomNavigationBar:
                    BottomNavigationBar(
                      type : BottomNavigationBarType.fixed ,
                      onTap : (int index){

                        print(history[index]["index"]);
                        history[index]["index"]=controller.currentindex.value ;
                        print(history[index]["index"]);
                        controller.currentindex.value=index;

                      } ,
                      backgroundColor: Colors.white,
                      currentIndex : controller.currentindex.value ,
                      selectedItemColor: Color(0xffE6424B),
                      unselectedItemColor: Color(0xffADADAD),
                      elevation: 8.0,

                      items: [
                        BottomNavigationBarItem(
                          icon: Icon(
                              Icons.home
                          ),
                          label: 'Accueil',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(
                              Icons.art_track
                          ),
                          label: 'Accueil',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(
                              Icons.history
                          ),
                          label: 'Historique',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(
                              Icons.shopping_bag
                          ),
                          label: 'Panier',
                        ),

                      ],
                    ),
                  )),
          ));
  }



}