import 'package:fastraiteur/View/CartScreen.dart';
import 'package:fastraiteur/View/OnBoardingScreen.dart';
import 'package:fastraiteur/View/SearchScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main()  {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)  {
          return ScreenUtilInit(
              designSize: const Size(360, 800),
              splitScreenMode: true,
              minTextAdapt: true,
              builder: ( context, Widget? child) {
                return GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    scaffoldBackgroundColor: Colors.black,
                  ),
                  initialRoute: 'OnBoarding',
                  routes: {

                    '/' : (contexte)=>OnBoardingScreen() ,

                  },


                );
              }
          );
        }

}

