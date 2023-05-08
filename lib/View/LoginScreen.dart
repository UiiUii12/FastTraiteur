import 'package:auto_size_text/auto_size_text.dart';
import 'package:fastraiteur/Controller/LoginController.dart';
import 'package:fastraiteur/View/OTPScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
       body :
       Container(
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
              SizedBox(height :100.h), //283 90
              Image(image: AssetImage("Asset/Images/Login.png"), height: 251.h, width: 251.w, fit: BoxFit.cover,),
              SizedBox(height :52.h),
              Row(
                children: [
                  SizedBox(width: 22.w,),
                  Expanded(
                    child: AutoSizeText("Entrez votre numéro de téléphone" ,
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
                TextField(
                  controller: controller.phoneNumber,
                  textAlign: TextAlign.left,
                  style: TextStyle( fontSize: 14.sp),
                  cursorColor: Colors.grey,
                  enabled: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone , color: Color(0xffABABAB), size: 25,),
                    counterText: "",
                    contentPadding: EdgeInsetsDirectional.only(start: 11.w),
                    hintText: 'Numéro de telephone',
                    hintStyle: TextStyle(

                      fontSize: 14.sp,
                      color: Color(0xffABABAB),
                    ),
                     border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.transparent,
                    isCollapsed: true,
                  ),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  textAlignVertical: TextAlignVertical.center,
                  maxLength: 10,
                  onSubmitted: (value){
                    controller.onSubmitLogin();
                  },
                    onChanged: (phoneNumber) {
                      controller.onSubmitLogin();
                      if (controller.submit1 ) {
                        FocusScope.of(context).unfocus();
                      }
                      ;
                    }
                ),
              ),
            ),
            SizedBox(height: 57.h,),
            GetBuilder<LoginController>(
              builder: (controller) {
                return Container(
                  height: 51.h,
                  width: 316.w,
                  child: ElevatedButton(
                    onPressed: controller.submit1 ? (){
                      Get.to(OTPScreen()) ;
                    } : (){},
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
                );
              }
            ),
          ],
        ),
      )
    );
  }
}
