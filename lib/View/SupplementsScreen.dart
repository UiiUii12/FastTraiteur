import 'package:auto_size_text/auto_size_text.dart';
import 'package:fastraiteur/Controller/CartController.dart';
import 'package:fastraiteur/Controller/SupplementsController.dart';
import 'package:fastraiteur/View/TrackOrderScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Model/Widgets/FoodCartWidget.dart';
import '../Model/Widgets/FoodConfirmedCartWidget.dart';
import '../Model/Widgets/buttonWidget.dart';

class SupplementsScreen extends StatelessWidget {
  SupplementsScreen({Key? key}) : super(key: key);
  SupplementsController controller =Get.put(SupplementsController(),permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF3F3F3),
      appBar: PreferredSize(
        preferredSize:Size.fromHeight(70.h),
        child: AppBar(
          title: AutoSizeText('Finaliser la commande'),
          backgroundColor: Color(0XFF272727),
          elevation: 0,
          leading: IconButton(
            icon: SvgPicture.asset('Asset/Images/BackIcon.svg'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
        ),
      ),
      body:
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 24.h,),
            ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: controller.CartConfirmed.length,
              itemBuilder: (context,index)=>
                  Column(
                    children: [
                      Column(
                        children: [
                          FoodConfirmedCartWidget(controller.CartConfirmed[index]),
                          SizedBox(height: 17.h,),
                        ],
                      ),
                    ],
                  ),

            ),
            SizedBox(height: 24.h,),
            SizedBox(height: 22.h,),
            button('Continuer',()=>Get.to(TrackOrderScreen()),),
            SizedBox(height: 10.h,)



          ],
        ),
      ),
    );
  }

}
