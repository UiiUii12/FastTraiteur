import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Classes/Food.dart';

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
                 SizedBox(
                   height: 30.h,
                   width: 30.w,
                   child: FloatingActionButton(
                       onPressed: (){},
                       elevation:1,
                       backgroundColor:Color(0XFFFF9900),
                       child: Icon(Icons.remove,size: 20.sp,),
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.all(Radius.circular(10.r))
                       )),

                 ),
                 SizedBox(width: 6.sp,),
                 AutoSizeText('2',style: TextStyle(fontSize:16.sp ,fontWeight:FontWeight.w600 ,),),
                 SizedBox(width: 6.sp,),
                 SizedBox(
                   height: 30.h,
                   width: 30.w,
                   child: FloatingActionButton(
                       onPressed: (){},
                       elevation:1,
                       backgroundColor:Color(0XFFFF9900),
                       child: Icon(Icons.add,size: 20.sp,),
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.all(Radius.circular(10.r))
                       )),

                 ),
              
                SizedBox(width:11.w ,)
              ],
            ),
          ],),



      ],
    ),
  );

}