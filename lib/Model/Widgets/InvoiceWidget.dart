import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget InvoiceWidget(double prixPartiel,double tax,double prixTotal){
  return Container(
    height:116.h,
    width:332.w,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16.r),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 16.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText('Prix partiel',style: TextStyle(fontSize:16.sp ,fontWeight: FontWeight.w600),),
                SizedBox(height: 10.h,),
                AutoSizeText('Tax',style: TextStyle(fontSize:16.sp ,fontWeight: FontWeight.w600),),
                SizedBox(height: 10.h,),
                AutoSizeText('Prix total',style: TextStyle(fontSize:16.sp ,fontWeight: FontWeight.w600),),
              ],),
            SizedBox(width: 75.w,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AutoSizeText('${prixPartiel} DA',style: TextStyle(fontWeight:FontWeight.w400 ,fontSize: 16,),),
                  SizedBox(height: 10.h,),
                  AutoSizeText('${tax} DA',style: TextStyle(fontWeight:FontWeight.w400 ,fontSize: 16,)),
                  SizedBox(height: 10.h,),
                  AutoSizeText('${prixTotal} DA',style: TextStyle(fontWeight:FontWeight.w400 ,fontSize: 16,color: Color(0XFFE72900))),
                ],),
            ),
            SizedBox(width: 11.w,),
          ],
        ),
      ],
    ),
  );
}