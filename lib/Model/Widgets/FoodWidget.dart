import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Controller/RestaurantController.dart';

Widget FoodWidget (String image,String name,double price) {

    return Container(
      width:149.w,
      height: 219.h,
      decoration:BoxDecoration(
          color: Color(0XFFFFFFFF),
          borderRadius: BorderRadius.circular(16.r)
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 4.h,),
          ClipRRect(
            child: Image.asset(
              image,
              height:132.h ,
              width:141.w ,
              fit: BoxFit.cover,),
            borderRadius: BorderRadius.circular(16.r),
          ),
          SizedBox(height: 19.h,),
          Row(
            children: [
              SizedBox(width: 8.w,),
              AutoSizeText(name,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600,)),
            ],
          ),
          SizedBox(height: 8.h,),
          Row(
            children: [
              SizedBox(width: 8.w,),
              Expanded(child: AutoSizeText('${price} DA',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600,),)),

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
              SizedBox(width: 4.w,),
            ],
          ),
        ],
      ),

    );
  }

