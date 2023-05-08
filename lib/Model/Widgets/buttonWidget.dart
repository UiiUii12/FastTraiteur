import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget button(String text,VoidCallback OnPressed){
  return Container(
    height: 51.h,
    width: 316.w,
    child: ElevatedButton(
      onPressed:OnPressed,
      child: Text(
        text,
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