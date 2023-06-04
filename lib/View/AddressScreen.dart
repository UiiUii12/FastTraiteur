import 'package:auto_size_text/auto_size_text.dart';
import 'package:fastraiteur/Controller/AddressController.dart';
import 'package:fastraiteur/Model/Classes/Category.dart';
import 'package:fastraiteur/Model/Widgets/buttonWidget.dart';
import 'package:fastraiteur/View/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({Key? key}) : super(key: key);
  AddressController controller = Get.put(AddressController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  tileMode: TileMode.repeated ,
                  colors: [
                    Color.fromRGBO(29, 29, 29,0.88),
                    Color(0xff000000).withOpacity(1),
                  ] ,
                  stops: [
                    0.6 ,
                    1
                  ]
              )
          ),
          child: Column(
            children: [
              SizedBox(height :90.h), //283 90
              Image(image: AssetImage("Asset/Images/Address.png"), height: 283.h, width: 283.w, fit: BoxFit.cover,),
              SizedBox(height :30.h),
              Row(
                children: [
                  SizedBox(width: 22.w,),
                  Expanded(
                    child: AutoSizeText("Indiquez votre adresse" ,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30.sp ,
                          fontWeight: FontWeight.w600 ,
                          color :Colors.white
                      ),),
                  ) ,
                  SizedBox(width: 22.w,),
                ],
              ),

              SizedBox(height: 55.h,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r)),
                height: 51.h,
                width: 316.w,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child:
                  TextFormField(
                    controller: controller.address,
                    textAlign: TextAlign.left,
                    style: TextStyle( fontSize: 14.sp),
                    cursorColor: Colors.grey,
                    enabled: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_on_outlined , color: Color(0xffABABAB), size: 25,),

                      contentPadding: EdgeInsetsDirectional.only(start: 11.w),
                      hintText: 'Adresse',
                      hintStyle: TextStyle(

                        fontSize: 14.sp,
                        color: Color(0xffABABAB),
                      ),
                      counterText: "",
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.transparent,
                      isCollapsed: true,
                    ),
                    keyboardType: TextInputType.streetAddress,
                    textInputAction: TextInputAction.done,
                    textAlignVertical: TextAlignVertical.center,

                    onChanged: (value) {

                    },
                  ),
                ),
              ),
              SizedBox(height: 57.h,),
              GetBuilder<AddressController>(
                builder: (controller) {
                  return button('Continue', ()=>Get.to(HomeScreen()));
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
