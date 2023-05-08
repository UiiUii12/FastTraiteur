import 'package:fastraiteur/Controller/HomeController.dart';
import 'package:fastraiteur/Controller/RestaurantController.dart';
import 'package:fastraiteur/Model/Widgets/FoodWidget.dart';
import 'package:fastraiteur/Model/Widgets/RestaurantWidget.dart';
import 'package:fastraiteur/View/RestaurantScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body:
            Stack(
                children:
                [
                  Column(
                    children: [
                      Container(
                          height: 260.h,
                          decoration: BoxDecoration(
                              color: Color(0xff272727)
                          ),
                          child:Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                SizedBox(height:28.h),
                                Row(
                                  children: [
                                    SizedBox(width: 22.w,),
                                    AutoSizeText(
                                        "Localisation",
                                        style:TextStyle(
                                            fontSize: 14.sp ,
                                            color: Color(0xffD9D9D9)
                                        )

                                    ),
                                  ],
                                ) ,
                                SizedBox(height: 5.h,),
                                Row(
                                  children: [
                                    SizedBox(width: 22.w,),
                                    AutoSizeText(
                                      "Sidi bel Abbes, Algerie",
                                      style: TextStyle(
                                        fontSize: 16.sp ,
                                        color: Colors.white ,
                                      ),
                                    ),
                                    SizedBox(width: 7.w),
                                    Icon(
                                      Icons.mode_edit , size: 20.sp, color: Colors.white,
                                    ) ,

                                  ],
                                ) ,
                                SizedBox(height: 25.h,),
                                Row(
                                  children: [
                                    SizedBox(width: 22.w,),
                                    Container(

                                      height:52.h ,
                                      width:315.w ,
                                      decoration: BoxDecoration(
                                        color: Color(0xff303030),
                                        borderRadius: BorderRadius.circular(16.r),
                                      ),
                                      child: TextField(
                                          controller: controller.input,
                                          textAlign: TextAlign.left,
                                          style: TextStyle( fontSize: 14.sp),
                                          cursorColor: Colors.grey,
                                          enabled: true,
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.search , color: Colors.white, size: 25,),
                                            suffixIcon: Container(
                                              margin: EdgeInsets.symmetric(vertical: 4.h , horizontal: 5.w),
                                              height: 44.h,
                                              width: 44.w,
                                              decoration: BoxDecoration(
                                                color: Color(0xffFF9900),
                                                borderRadius: BorderRadius.circular(16.r),
                                              ),
                                              child: Icon(
                                                Icons.security_update_warning_sharp , size: 25, color: Colors.white,
                                              ),
                                            ),
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
                                ) ,





                              ]
                          )
                      ),
                      Expanded(
                        child: Container(
                          color: Color(0xffF3F3F3),



                        ),
                      ),
                    ],
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 188.h ,left: 22.w ),
                    height: 140.h,
                    width: 315.w,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(16.r),
                      image: DecorationImage(image: AssetImage("Asset/Images/promo.png") , fit: BoxFit.cover),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left :16.w , top: 14.h ),
                          height: 30.h,
                          width: 61.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: Color(0xffE72A00)
                          ),
                          child: Center(
                            child: AutoSizeText(
                              "Promo",
                              style: TextStyle(
                                  fontSize: 14.sp ,
                                  color: Colors.white ,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        ) ,
                        SizedBox(height: 11.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 16.w),
                              width: 194.w,
                              child: AutoSizeText("Commandez 2 et obtenez 1 gratuit" ,
                                style: TextStyle(

                                  fontWeight: FontWeight.w600,
                                  fontSize: 22.sp ,
                                  color: Colors.white ,

                                ),),
                            ),
                          ],
                        )
                      ],
                    ),
                  ) ,
                  Container(
                    margin:EdgeInsets.only(top:360.h) ,
                    child:
                    Column(
                      children: [
                        GetX<HomeController>(
                            builder: (context) {
                              return Container(

                                width: double.infinity,
                                height: 360.h ,
                                child: Column(
                                    children:[
                                      Row(
                                          children :[


                                            Expanded(
                                              child: TabBar(
                                                  controller: controller.tabcontroller,
                                                  physics: BouncingScrollPhysics(),
                                                  indicatorColor: Colors.transparent,
                                                  labelColor: Color(0xffFF9900),

                                                  unselectedLabelColor: Colors.white,
                                                  isScrollable: true,
                                                  onTap: (index){
                                                    controller.index.value = index ;
                                                  },
                                                  labelPadding: EdgeInsets.only(left: 0 , right : 8.w),
                                                  tabs:[
                                                    Row(
                                                      children: [
                                                        SizedBox(width:22.w),
                                                        Container(
                                                          height:38.h,
                                                          width: 66.w,
                                                          decoration:BoxDecoration(
                                                              color: controller.index.value == 0 ? Color(0xffFF9900) : Colors.white,
                                                              borderRadius: BorderRadius.circular(14.r)
                                                          ),
                                                          child: Center(
                                                            child: AutoSizeText("Tous",
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                fontSize: 14.sp ,
                                                                fontWeight: FontWeight.w400,
                                                                color :controller.index.value == 0 ? Colors.white : Color(0xff303030),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      height:38.h,
                                                      width: 104.w,
                                                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                                                      decoration:BoxDecoration(
                                                          color: controller.index.value == 1 ? Color(0xffFF9900) : Colors.white,
                                                          borderRadius: BorderRadius.circular(14.r)
                                                      ),
                                                      child: Row(

                                                        children: [
                                                          Icon(
                                                            Icons.local_pizza ,
                                                            size:25,
                                                            color :controller.index.value == 1 ? Colors.white : Color(0xff303030),
                                                          ),
                                                          SizedBox(width: 10.w,),
                                                          AutoSizeText("Pizza",
                                                            style: TextStyle(
                                                                fontSize: 14.sp,
                                                                fontWeight: FontWeight.w400,
                                                                color :controller.index.value == 1 ? Colors.white : Color(0xff303030)
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      height:38.h,
                                                      width: 104.w,
                                                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                                                      decoration:BoxDecoration(
                                                          color: controller.index.value == 2 ? Color(0xffFF9900) : Colors.white,
                                                          borderRadius: BorderRadius.circular(14.r)
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons.local_pizza ,
                                                            size:25,
                                                            color :controller.index.value== 2 ? Colors.white : Color(0xff303030),
                                                          ),
                                                          SizedBox(width: 10.w,),
                                                          AutoSizeText("Burger",
                                                            style: TextStyle(
                                                              fontSize: 14.sp ,
                                                              fontWeight: FontWeight.w400,
                                                              color :controller.index.value == 2 ? Colors.white : Color(0xff303030),

                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      height:38.h,
                                                      width: 104.w,
                                                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                                                      decoration:BoxDecoration(
                                                          color: controller.index.value == 3 ? Color(0xffFF9900) : Colors.white,
                                                          borderRadius: BorderRadius.circular(14.r)
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons.local_pizza ,
                                                            size:25,
                                                            color :controller.index.value == 3 ? Colors.white : Color(0xff303030),
                                                          ),
                                                          SizedBox(width: 10.w,),
                                                          AutoSizeText("Soupe",
                                                            style: TextStyle(
                                                              fontSize: 14.sp ,
                                                              fontWeight: FontWeight.w400,
                                                              color :controller.index.value == 3 ? Colors.white : Color(0xff303030),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),

                                                  ]
                                              ),
                                            )

                                          ]
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(top: 28.h),
                                          child: TabBarView(
                                              controller: controller.tabcontroller,
                                              children: [
                                                ListView.builder(
                                                    shrinkWrap: true,
                                                    itemCount : controller.restaurant.length ,
                                                    itemBuilder: (builder , index){
                                                      return (index % 2 ==0) ?  Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              SizedBox(width :22.w),
                                                              InkWell(
                                                                  onTap: (){
                                                                    RestaurantController tab=Get.put(RestaurantController(),permanent: true);
                                                                    tab.inisialize(controller.restaurant[index].categories.length, 0);
                                                                    Get.to(RestaurantScreen(image:controller.restaurant[index].photo , name: controller.restaurant[index].nom, category:[], adress:controller.restaurant[index].addresse));
                                                                  },
                                                                  child: RestaurantWidget(controller.restaurant[index].nom , controller.restaurant[index].photo ,controller.restaurant[index].addresse )) ,
                                                              SizedBox(width: 17.w,),
                                                              index< controller.restaurant.length-1  ? InkWell(
                                                                  onTap:(){
                                                                    RestaurantController tab=Get.put(RestaurantController(),permanent: true);
                                                                    tab.inisialize(controller.restaurant[index+1].categories.length, 0);
                                                                    Get.to(RestaurantScreen(image:controller.restaurant[index+1].photo , name: controller.restaurant[index+1].nom, category:[], adress:controller.restaurant[index+1].addresse));
                                                                  },
                                                                  child: RestaurantWidget(controller.restaurant[index+1].nom , controller.restaurant[index+1].photo ,controller.restaurant[index+1].addresse )) :Container(),
                                                              SizedBox(width :22.w),

                                                            ],
                                                          ),
                                                          SizedBox(height: 17.h,)
                                                        ],
                                                      ): Container();
                                                    }) ,
                                                ListView.builder(
                                                    shrinkWrap: true,
                                                    itemCount : controller.plats.length ,
                                                    itemBuilder: (builder , index){
                                                      return (index % 2 ==0) ?  Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              SizedBox(width :22.w),
                                                              FoodWidget(controller.plats[index].image, controller.plats[index].name ,controller.plats[index].price) ,
                                                              SizedBox(width: 17.w,),
                                                              index< controller.plats.length-1  ? FoodWidget(controller.plats[index+1].image, controller.plats[index+1].name , controller.plats[index+1].price ) :Container(),
                                                              SizedBox(width :22.w),

                                                            ],
                                                          ),
                                                          SizedBox(height: 17.h,)
                                                        ],
                                                      ): Container();
                                                    }) ,
                                                Container(child: AutoSizeText("tab3"),),
                                                Container(child: AutoSizeText("tab4"),),
                                              ]
                                          ),
                                        ),
                                      )
                                    ]
                                ),
                              );
                            }
                        )
                      ],
                    ),
                  )
                ]
            )
        )
    );
  }


}