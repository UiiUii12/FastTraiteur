import 'package:auto_size_text/auto_size_text.dart';
import 'package:fastraiteur/Controller/ConfirmeCartController.dart';
import 'package:fastraiteur/View/ConfirmeOrderScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Model/Classes/Food.dart';
class ConfirmCartScreen extends StatelessWidget {
  ConfirmCartScreen ({Key? key}) : super(key: key);

  ConfirmCartController controller = Get.put(ConfirmCartController());
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          body: Container(
            height: 693.h,
            margin: EdgeInsets.only(top: 179.h),
            color:Color(0xffF3F3F3) ,
            child: Column(
              children: [
                ListView.builder(
                    itemBuilder: (item , index) {
                      return Column(
                        children: [
                          FoodWidgetCart(controller.Cart[index]),
                          SizedBox(height: 17.h,),
                        ],
                      );
                    }
                ),
                Row(
                  children: [
                    SizedBox(width :14.w),
                    AutoSizeText(
                      "Supplements" ,
                      style: TextStyle(
                        fontSize: 16.sp ,
                        color: Color(0xff272727) ,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 17.h,),
                Row(
                  children: [
                    SizedBox(width: 15.w,),
                    Expanded(
                      child: GetBuilder<ConfirmCartController>(
                          builder: (controller) {
                            return Supplements();
                          }
                      ),
                    ),
                    SizedBox(width: 15.w,),
                  ],
                ) ,
                Container(
            height: 51.h,
            width: 316.w,
            child: ElevatedButton(
              onPressed: (){
                Get.to(
                  ConfirmeOrderScreen()
                ) ;
              },
              child: Text(
                'Continue',
                style: TextStyle(
                  fontSize: 22.sp,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffFF9900)  ,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  )),
            ),
          )
              ],
            ),
          ),
        ));
  }
  Widget Supplements () {
    return Container(
        height: 130.h,
        width: double.maxFinite,
        child: MultiSelectContainer(
          items: controller.supplements,
          onChange: (selected_items , item){
            selected_items.add(item);
            controller.selected_items= selected_items ;
          } ,
          maxSelectableCount: 4,
          textStyles: MultiSelectTextStyles(
              textStyle: TextStyle(
                fontSize: 14.sp ,
                color : Colors.black ,
              ),
              selectedTextStyle: TextStyle(
                  fontSize: 14.sp ,
                  color: Colors.white
              )
          ),
          itemsDecoration: MultiSelectDecorations(
              decoration: BoxDecoration(
                borderRadius : BorderRadius.circular(14.r) ,
                color: Colors.white ,
              ),
              selectedDecoration: BoxDecoration(
                color: Color(0xffFF9900) ,
                borderRadius: BorderRadius.circular(14.r),

              )
          ),
        )
      /* MultiSelectChipDisplay(
                      items: controller.items,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   chipColor: Colors.white,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.r),

                      ),
                      onTap: (item){
                        controller.index== controller.supplements.indexOf(item) ?
                        controller.color = controller.color ==Color(0xffFF9900) ? Colors.white : Color(0xffFF9900) : controller.color=Colors.white ;
                        return null ;

                      },
                      textStyle: TextStyle(
                        color: Colors.black
                      ),
                      colorator:(color){
                        return controller.color  ;
                        },
                      icon: null,
                      height: 38.h,
                    ),*/
    );

  }
  Widget FoodWidgetCart(Food food){
    return
      Container(
        height: 116.h,
        width:332.w ,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 4.w,),
            ClipRRect(
              child: Image.asset(
                food.image,
                height:108.h ,
                width:115.w ,
                fit: BoxFit.cover,),
              borderRadius: BorderRadius.circular(16.r),
            ),
            SizedBox(width: 14.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(food.name,style: TextStyle(fontSize:16.sp ,fontWeight:FontWeight.w600 ,),),
                Container(
                    width: 114.w,
                    child: AutoSizeText(food.description,style: TextStyle(fontSize:14.sp ,fontWeight:FontWeight.w400 ,color: Color(0XFF7D7D7D)),)),
                Row(
                  children: [
                    AutoSizeText('${food.price} DA',style: TextStyle(fontSize:16.sp ,fontWeight:FontWeight.w600 ,),),
                    Container(
                      height: 30.h,
                      width: 30.w,
                      child :
                      AutoSizeText('2',style: TextStyle(fontSize:16.sp ,fontWeight:FontWeight.w600 ,),),
                      decoration: BoxDecoration(
                        color: Color(0XFFFF9900) ,
                          borderRadius: BorderRadius.all(Radius.circular(10.r))
                      ),


                    ),


                    SizedBox(width:11.w ,)
                  ],
                ),
              ],),



          ],
        ),
      );

  }
}
