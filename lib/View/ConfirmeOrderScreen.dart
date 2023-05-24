import 'package:auto_size_text/auto_size_text.dart';
import 'package:fastraiteur/Controller/ConfirmeOrderController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ConfirmeOrderScreen extends StatelessWidget {
  ConfirmeOrderScreen({Key? key}) : super(key: key);

  ConfirmeOrderController controller = Get.put(ConfirmeOrderController()) ;

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
                SizedBox(height: 24.h,),
                Row(
                  children: [
                    SizedBox(width: 14.w,),
                    AutoSizeText(
                      "Localisation" ,
                      style: TextStyle(
                          fontSize: 16.sp ,
                          color: Color(0xff272727) ,
                      ),

                    ),
                  ],
                ),
                SizedBox(height: 17.h,),
                Row(
                  children: [
                    SizedBox(width: 14.w,),
                    Container(
                      height:50.h ,
                      width: 332.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: Colors.white ,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child:
                        TextField(
                                controller: controller.localisation,
                                textAlign: TextAlign.left,
                                style: TextStyle( fontSize: 14.sp , color: Color(0xff272727)),
                                cursorColor: Colors.grey,
                                showCursor : controller.edit.value ,
                                autofocus: controller.edit.value,
                                readOnly: ! controller.edit.value,
                                enabled: true,
                                decoration: InputDecoration(
                                  suffixIcon:
                                  GetBuilder<ConfirmeOrderController>(
                                    builder: (controller) {
                                      return IconButton(
                                        icon : Icon(controller.edit.value ?Icons.check :Icons.edit , color: Color(0xffABABAB), size: 25,),
                                        onPressed: () {
                                          controller.edit =true.obs ;
                                        },
                                      );
                                    }
                                  ),
                                  counterText: "",
                                  contentPadding: EdgeInsetsDirectional.only(start: 11.w),
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  isCollapsed: true,
                                ),
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                textAlignVertical: TextAlignVertical.center,
                                onSubmitted: (value){
                                  controller.edit =false.obs ;
                                },

                            ) ,

                      ),
                    ),
                    SizedBox(width: 14.w,),
                  ],
                ),
                SizedBox(height: 24.h,),
                Row(
                  children: [
                    SizedBox(width: 14.w,) ,
                    AutoSizeText(
                        "Message" ,
                         style: TextStyle(
                           fontSize: 16 ,
                           color : Color(0xff272727),
                         ),
                    )
                  ],
                ) ,
                SizedBox(height: 17.h,),
                Row(
                  children: [
                    SizedBox(
                      width: 14.w,
                    ),
                    Container(
                      height:116.h ,
                      width: 332.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: Colors.white ,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child:
                        TextField(
                          controller: controller.message,
                          textAlign: TextAlign.left,
                          style: TextStyle( fontSize: 14.sp , color: Color(0xff272727)),
                          cursorColor: Colors.grey,
                          enabled: true,
                          decoration: InputDecoration(
                            counterText: "",
                            hintText: "Message ...",
                            contentPadding: EdgeInsetsDirectional.only(start: 11.w),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.transparent,
                            isCollapsed: true,
                          ),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          onSubmitted: (value){
                          },

                        ) ,

                      ),
                    ),
                  ],
                )

              ],
            ),
          ),
        )
    );
  }
}
