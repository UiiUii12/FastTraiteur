

import 'package:auto_size_text/auto_size_text.dart';
import 'package:fastraiteur/Controller/OTPController.dart';
import 'package:fastraiteur/View/AddressScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({Key? key}) : super(key: key);
  OTPController controller = Get.put(OTPController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:
        Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
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
             child:  Column(
                children: [
                  SizedBox(height:68.h) ,
                  Image(image: AssetImage("Asset/Images/OTP.png") , height: 322.h, width: 317.w, fit: BoxFit.cover,),
                  SizedBox(height:13.h),
                  Row(
                    children: [
                      SizedBox(width: 22.w,),

                      Expanded(
                        child: Column(
                          children: [
                            AutoSizeText(
                              "Nous vous avons envoyé un code!" ,
                               textAlign: TextAlign.center,
                               style:TextStyle(
                                 fontSize: 30.sp ,
                                 color: Colors.white ,
                                 fontWeight: FontWeight.w600 ,

                               ) ,

                            ),
                            SizedBox(height: 55.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //SizedBox(width: 17.w,),
                                _textFieldOTP(
                                  first: true,
                                  last: false,
                                  numero: 1,
                                  digitCodeN: controller.digitCode1,
                                  context: context,
                                ),
                                SizedBox(width: 17.w,),
                                _textFieldOTP(
                                  first: false,
                                  last: false,
                                  numero: 2,
                                  digitCodeN: controller.digitCode2,
                                  context: context,
                                ),
                                SizedBox(width: 17.w,),
                                _textFieldOTP(
                                  first: false,
                                  last: false,
                                  numero: 3,
                                  digitCodeN: controller.digitCode3,
                                  context: context,
                                ),
                                SizedBox(width: 17.w,),
                                _textFieldOTP(
                                  first: false,
                                  last: false,
                                  numero: 4,
                                  digitCodeN: controller.digitCode4,
                                  context: context,
                                ),
                                SizedBox(width: 17.w,),
                                _textFieldOTP(
                                  first: false,
                                  last: false,
                                  numero: 5,
                                  digitCodeN: controller.digitCode5,
                                  context: context,
                                ),




                               // SizedBox(width: 15.w,),
                              ],
                            ),

                          ],
                        ),
                      ) ,
                      SizedBox(width: 22.w,),

                    ],
                  ),
                  SizedBox(height: 57.h,),
                  GetBuilder<OTPController>(
                    builder: (controller) {
                      return Container(
                        height: 51.h,
                        width: 316.w,
                        child: ElevatedButton(
                          onPressed: controller.submit ?(){
                            controller.CreateUser() ;
                            Get.to(AddressScreen());
                          }: (){},
                          child: Text(
                            'Confirmez',
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
                      );
                    }
                  ),
                ],
              )
            ))
    );
  }
  Widget _textFieldOTP(
      {required bool first,
        required bool last,
        required int numero,
        required BuildContext context ,
        required TextEditingController digitCodeN}) {
    return Container(
      height: 48.h,
      width: 42.w,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
      child: TextFormField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.number,
        showCursor: true,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: Colors.black,
        textAlign: TextAlign.center,
        controller: digitCodeN,
        style: TextStyle(
          fontSize: 18.sp,
          fontFamily: 'Golos',
        ),
        onChanged: (value) {
         controller.onSubmitOTP();
         if ((value.length == 1) && (last == false)) {
           FocusScope.of(context).nextFocus();
         } else if ((value.length == 0) && (first == false)) {
           FocusScope.of(context).previousFocus();
         } else if ((value.length == 1) && (last == true)) {
           FocusScope.of(context).unfocus();
         }
        },
      ),
    );
  }
}
