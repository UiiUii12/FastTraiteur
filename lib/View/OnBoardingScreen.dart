import 'package:auto_size_text/auto_size_text.dart';
import 'package:fastraiteur/View/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Column(
        children: [
           Stack(
             children: [
               Image(image: AssetImage('Asset/Images/3 1.png') , height: 290.h, width: double.infinity, fit: BoxFit.cover,) ,

               Container(

                 height:320.h,
                 decoration: BoxDecoration(
                     gradient: LinearGradient(
                       begin: Alignment.topCenter,
                         end: Alignment.bottomCenter,
                         colors: [
                           Color(0xff050403).withOpacity(0.175),

                           Color.fromARGB(5, 4, 3, 0).withOpacity(1),

                         ] ,

                     )
                 ),
               ),

             ],
           ),
          SizedBox(height: 108.h,),
          Row(
            children: [
              SizedBox(width: 22.w,),
              Expanded(
                child: Column(
                  children: [
                    AutoSizeText("Découvrez les meilleurs restaurants" ,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30.sp ,
                          color: Colors.white ,
                          fontWeight: FontWeight.w600
                      ),) ,
                    SizedBox(height: 20.h,),
                    AutoSizeText("Différentes catégories, les prix les plus adaptés et la livraison la plus rapide" ,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp ,
                        fontWeight: FontWeight.w400 ,
                        color: Colors.white ,
                      ),) ,
                    SizedBox(height: 82.h,),
                    Container(
                      height: 51.h,
                      width: 316.w,
                      child: ElevatedButton(
                        onPressed:(){
                          Get.to(LoginScreen());
                        },
                        child: Text(
                          'Commandez',
                          style: TextStyle(
                            fontSize: 22.sp,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffFF9900),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            )),
                      ),
                    ),
                  ],
                ),
              ) ,
              SizedBox(width: 22.w,),
            ],
          ),


        ],
      ),
    );
  }
}
