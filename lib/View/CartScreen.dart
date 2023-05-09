import 'package:auto_size_text/auto_size_text.dart';
import 'package:fastraiteur/Controller/CartController.dart';
import 'package:fastraiteur/Model/Widgets/InvoiceWidget.dart';
import 'package:fastraiteur/View/OnBoardingScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Model/Widgets/FoodCartWidget.dart';
import '../Model/Widgets/buttonWidget.dart';

class CartScreen extends StatelessWidget {
   CartScreen({Key? key}) : super(key: key);
  CartController controller =Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF3F3F3),
      body:
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: controller.Cart.length,
                  itemBuilder: (context,index)=>
                    Column(
                    children: [
                      Dismissible(
                         background: Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                            Container(
                            child: Image.asset('Asset/Images/image 42.png')),
                           ],
                         ),
                         key: ValueKey<String>(controller.Cart[index].id),
                         onDismissed: (DismissDirection direction){
                           //fontion du supp d'un plats
                           controller.removeFromCart(controller.Cart, index);
                         },
                        child: Column(
                          children: [

                            Container(),
                            Container(),
                            Container(),
                            Container(),
                            Container(),
                            FoodWidgetCart(controller.Cart[index]),
                            SizedBox(height: 17.h,),
                          ],
                        ),
                      ),
                      index==controller.Cart.length-1?
                      InvoiceWidget(1550, 250,1750):Container()
                    ],
                  ),

                ),
                SizedBox(height: 22.h,),
                button('Continuer',()=>Get.to(OnBoardingScreen())),
                SizedBox(height: 10.h,)



              ],
            ),
          ),
    );
  }

}
