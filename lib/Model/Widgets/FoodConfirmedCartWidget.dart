import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Classes/Food.dart';

Widget FoodConfirmedCartWidget(Food food){
  return Container(
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
            SizedBox(height: 12.h,),
            Row(
              children: [
                AutoSizeText('${food.price} DA',style: TextStyle(fontSize:16.sp ,fontWeight:FontWeight.w600 ,),),
                Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                      color: Color(0XFFFF9900),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Center(
                      child: AutoSizeText(
                        '2',
                        style: TextStyle(fontSize:16.sp ,fontWeight:FontWeight.w600 ,color: Colors.white),),
                    )),
                SizedBox(width: 11.w,),
              ],
            ),
          ],),



      ],
    ),
  );

}