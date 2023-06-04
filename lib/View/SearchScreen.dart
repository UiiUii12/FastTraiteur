import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:order_tracker/order_tracker.dart';
import '../Controller/SearchController.dart';
import '../Controller/TrackOrderController.dart';
import '../Model/Widgets/FoodWidget.dart';


class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  SearchController controller =Get.put(SearchController(),permanent: true);
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFF3F3F3),
        appBar: PreferredSize(
          preferredSize:Size.fromHeight(70.h),
          child: AppBar(
            title: AutoSizeText('Résulatats'),
            backgroundColor: Color(0XFF272727),
            elevation: 0,
            leading: IconButton(
              icon: SvgPicture.asset('Asset/Images/BackIcon.svg'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            centerTitle: true,
          ),
        ),
        body:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 17.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height:48.h ,
                  width:315.w ,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: TextField(
                      controller: controller.searchInput,
                      textAlign: TextAlign.left,
                      style: TextStyle( fontSize: 12.sp),
                      cursorColor: Colors.grey,
                      enabled: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search , color: Color(0xff7D7D7D), size: 20.sp,),
                        counterText: "",
                        contentPadding: EdgeInsetsDirectional.only(start: 11.w),
                        hintText: 'Chercher un restaurant',
                        hintStyle: TextStyle(

                          fontSize: 14.sp,
                          color: Color(0xff7D7D7D),
                        ),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.transparent,
                        isCollapsed: true,
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      textAlignVertical: TextAlignVertical.center,
                      maxLength: 10,
                      onSubmitted: (value){

                      },
                      onChanged: (phoneNumber) {


                      }
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h,),
            Expanded(
              child: ListView.builder(
                  itemCount:controller.plats.length,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder:(context,index) {
                    return  Row(

                      children: [
                        SizedBox(width: 23.w,),
                        Column(
                          children: [
                            FoodWidget(
                              controller.plats[index].image,
                              controller.plats[index].name,
                              controller.plats[index].price,),
                            SizedBox(height:17.h ,),
                          ],
                        ),
                        SizedBox(width: 17.w,),
                        index+1<controller.plats.length?
                        Column(
                          children: [
                            FoodWidget(
                              controller.plats[index+1].image,
                              controller.plats[index+1].name,
                              controller.plats[index+1].price,
                            ),
                            SizedBox(height:17.h ,),
                          ],
                        ):Container(),

                      ],
                    );
                  }
              ),
            )
          ],
        )
    );
  }

}
