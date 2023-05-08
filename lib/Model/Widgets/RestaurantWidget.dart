import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget RestaurantWidget ( String nom , String photo ,String addresse  ){
  return Container(
    height:196.h ,
    width: 149.w,
    decoration: BoxDecoration(
      color: Colors.white ,
      borderRadius: BorderRadius.circular(16.r),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 4.h , left: 4.w , right: 4.w),
          height: 118.h,
          width: 141.w,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(photo) , fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(16.r),

          ),
        ) ,
        SizedBox(height: 8.h,),
        Row(
          children: [
            SizedBox(width: 8.w,),
            Expanded(
              child: AutoSizeText(nom ,
                style: TextStyle(
                  fontSize: 16.sp ,
                  color: Color(0xff272727) ,
                ),
              ),
            ),
          ],
        ) ,
        Row(
          children: [
            SizedBox(width: 8.w,),
            Expanded(
              child: AutoSizeText(addresse ,
                style: TextStyle(
                  fontSize: 14.sp ,
                  color: Color(0xff7D7D7D) ,
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}