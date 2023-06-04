import 'package:auto_size_text/auto_size_text.dart';
import 'package:fastraiteur/Controller/RestaurantController.dart';
import 'package:fastraiteur/Model/Widgets/FoodWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Model/Classes/Category.dart';
import '../Model/Classes/Plat.dart';
import '../Model/Classes/Restaurant.dart';

class RestaurantScreen extends StatelessWidget {
  final String image;
  final String name;
  final String adress;

  RestaurantScreen({
    Key? key,
    required this.image,
    required this.name,
    required this.adress,
  }) : super(key: key);

  RestaurantController controller=Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFF3F3F3),
        body: Column(children: [
          Stack(
            children: [
              Container(
                height: 179.h,
                width: double.infinity,
                color: Color(0XFF272727),
              ),
              Positioned(
                top: 31.h,
                left: 5.w,
                  child: IconButton(
                    icon:SvgPicture.asset('Asset/Images/BackIcon.svg'),
                    onPressed: () {Get.back();},
                  ),

              ),
              Column(
                children: [
                  SizedBox(
                    height: 48.h,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        'Profil',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 21.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 180.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(image),
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 8.h,),
              AutoSizeText(
                this.name,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8.h,),
              AutoSizeText(
                this.adress,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0XFFAEAEAE),
                ),
              ),

            ],
          ),
          SizedBox(
            height: 32.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 27.w,
              ),
              AutoSizeText(
                'Menu',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22.sp,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Row(children: [
            SizedBox(width: 15.w),
            Expanded(
              child: GetBuilder<RestaurantController>(
                builder: (controller) {
                  return TabBar(
                      controller: controller.tabController,
                      physics: BouncingScrollPhysics(),

                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.r) ,
                          color :Color(0xffFF9900)
                      ),
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: Colors.white,
                      unselectedLabelColor: Color(0xff303030),
                      isScrollable: true,
                      tabs:controller.tabs()
                      /*  Container(
                          height:38.h ,
                          width: 66.w,
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(14.r) ,
                          ),
                          child: Center(
                            child: AutoSizeText("Tous",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14.sp ,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height:38.h,
                          width: 104.w,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          decoration:BoxDecoration(

                              borderRadius: BorderRadius.circular(14.r)
                          ),
                          child: Row(

                            children: [

                              SvgPicture.asset("Asset/Images/pizzaIcon.svg" ) ,

                              SizedBox(width: 10.w,),
                              AutoSizeText("Pizza",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
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
                              color:  Colors.white,
                              borderRadius: BorderRadius.circular(14.r)
                          ),
                          child: Row(
                            children: [

                              SvgPicture.asset("Asset/Images/burgerIcon.svg" ,height:25.h , width : 25.w) ,

                              SizedBox(width: 10.w,),
                              AutoSizeText("Burger",
                                style: TextStyle(
                                  fontSize: 14.sp ,
                                  fontWeight: FontWeight.w400,

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
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14.r)
                          ),
                          child: Row(
                            children: [

                              SvgPicture.asset("Asset/Images/burgerIcon.svg" ,width :25.w , height :25.h) ,

                              SizedBox(width: 10.w,),
                              AutoSizeText("Burger",
                                style: TextStyle(
                                  fontSize: 14.sp ,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),*/


                  );
                }
              ),
            ),
          ]),
         /* Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 28.h),
              child: TabBarView(
                  controller: controller.tabController,
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
                                      child: Restaurant(controller.restaurant[index].nom , controller.restaurant[index].photo ,controller.restaurant[index].addresse )) ,
                                  SizedBox(width: 17.w,),
                                  index< controller.restaurant.length-1  ? InkWell(
                                      onTap:(){
                                        RestaurantController tab=Get.put(RestaurantController(),permanent: true);
                                        tab.inisialize(controller.restaurant[index+1].categories.length, 0);
                                        Get.to(RestaurantScreen(image:controller.restaurant[index+1].photo , name: controller.restaurant[index+1].nom, category:[], adress:controller.restaurant[index+1].addresse));
                                      },
                                      child: Restaurant(controller.restaurant[index+1].nom , controller.restaurant[index+1].photo ,controller.restaurant[index+1].addresse )) :Container(),
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
                                  Plat(controller.Plats[index].nom , controller.Plats[index].photo ,controller.Plats[index].nom_rest , controller.Plats[index].prix ) ,
                                  SizedBox(width: 17.w,),
                                  index< controller.plats.length-1  ? Plat(controller.Plats[index+1].nom , controller.Plats[index+1].photo ,controller.Plats[index+0].nom_rest , controller.Plats[index+1].prix ) :Container(),
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
          ),*/
         SizedBox(height: 24.h,),
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: [
                for ( List<Plat> plats in controller.list.values.toList())
                   ListView.builder(
                            itemCount:plats.length,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemBuilder:(context,index) {
                              return (index % 2 == 0)
                                  ? Row(

                                children: [
                                  SizedBox(width: 23.w,),
                                  Column(
                                    children: [
                                      FoodWidget(
                                        "Asset/Images/burger.jpg",
                                        plats[index].nom,
                                        plats[index].prix,),
                                      SizedBox(height:17.h ,),
                                    ],
                                  ),
                                  SizedBox(width: 17.w,),
                                  index+1<plats.length?
                                  Column(
                                    children: [
                                      FoodWidget(
                                        "Asset/Images/burger2.jpg" ,
                                        plats[index+1].nom,
                                        plats[index+1].prix,
                                      ),
                                      SizedBox(height:17.h ,),
                                    ],
                                  ):Container(),

                                ],
                              ): Container();
                            }

                  ),

              ]
            ),
          )
        ]));
  }

}
