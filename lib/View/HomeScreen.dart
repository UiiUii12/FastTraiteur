import 'package:fastraiteur/Controller/HomeController.dart';
import 'package:fastraiteur/Controller/RestaurantController.dart';
import 'package:fastraiteur/Model/Classes/Plat.dart';
import 'package:fastraiteur/View/RestaurantScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_svg/svg.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(children: [
              Column(
                children: [
                  Container(
                      height: 260.h,
                      decoration: BoxDecoration(color: Color(0xff272727)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 28.h),
                            Row(
                              children: [
                                SizedBox(
                                  width: 22.w,
                                ),
                                AutoSizeText("Localisation",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xffD9D9D9))),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 22.w,
                                ),
                                AutoSizeText(
                                  "Sidi bel Abbes, Algerie",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 7.w),
                                Icon(
                                  Icons.mode_edit,
                                  size: 20.sp,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 22.w,
                                ),
                                Container(
                                  height: 52.h,
                                  width: 315.w,
                                  decoration: BoxDecoration(
                                    color: Color(0xff303030),
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: TextField(
                                      controller: controller.input,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 14.sp),
                                      cursorColor: Colors.grey,
                                      enabled: true,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.search,
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                        counterText: "",
                                        contentPadding:
                                            EdgeInsetsDirectional.only(
                                                start: 11.w),
                                        hintText:
                                            'Chercher un restaurant, plat',
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
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      maxLength: 10,
                                      onSubmitted: (value) {
                                        controller.Search();
                                      },
                                      onChanged: (phoneNumber) {}),
                                ),
                              ],
                            ),
                          ])),
                  Expanded(
                    child: Container(
                      color: Color(0xffF3F3F3),
                    ),
                  ),
                ],
              ),
              Container(
                height: 140.h,
                margin: EdgeInsets.only(top: 188.h),
                child: ListView.builder(

                  scrollDirection: Axis.horizontal,
                  itemCount: controller.promotion.length,
                  itemBuilder:(item , index)
                    {
                    return Row(
                      children: [
                        index==0 ? SizedBox(width : 22.w) : Container(),
                        Container(

                        height: 140.h,
                        width: 315.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          image: DecorationImage(
                              image: AssetImage(controller.promotion[index].photo),
                              fit: BoxFit.cover),
                        ),
                        child:
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 16.w, top: 14.h),
                                  height: 30.h,
                                  width: 80.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      color: Color(0xffE72A00)),
                                  child: Center(
                                    child: AutoSizeText(
                                      " ${controller.promotion[index].nom_restaurant} ",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 11.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 16.w),
                                      width: 194.w,
                                      child: AutoSizeText(
                                        controller.promotion[index].description,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 22.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),

                  ),
                        SizedBox(width : 15.w),
                      ],
                    ); }
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 360.h),
                child: Column(
                  children: [

                        Container(
                        width: double.infinity,
                        height: 360.h,
                        child: Column(children: [
                          Row(children: [
                            Expanded(
                              child: TabBar(
                                  controller: controller.tabcontroller,
                                  physics: BouncingScrollPhysics(),
                                  indicator: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14.r),
                                      color: Color(0xffFF9900)),
                                  indicatorSize: TabBarIndicatorSize.label,
                                  labelColor: Colors.white,
                                  unselectedLabelColor: Color(0xff303030),
                                  isScrollable: true,
                                  tabs: [
                                    Container(
                                      height: 38.h,
                                      width: 66.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(14.r),
                                      ),
                                      child: Center(
                                        child: AutoSizeText(
                                          "Tous",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 38.h,
                                      width: 104.w,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14.r)),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              "Asset/Images/pizzaIcon.svg"),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          AutoSizeText(
                                            "Pizza",
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 38.h,
                                      width: 104.w,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      decoration: BoxDecoration(
                                          color: controller.index.value == 2
                                              ? Color(0xffFF9900)
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(14.r)),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              "Asset/Images/burgerIcon.svg",
                                              height: 25.h,
                                              width: 25.w),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          AutoSizeText(
                                            "Burger",
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 38.h,
                                      width: 104.w,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      decoration: BoxDecoration(
                                          color: controller.index.value == 3
                                              ? Color(0xffFF9900)
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(14.r)),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              "Asset/Images/burgerIcon.svg",
                                              width: 25.w,
                                              height: 25.h),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          AutoSizeText(
                                            "Burger",
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),

                                  ]),
                            )
                          ]),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 28.h),
                              child: TabBarView(
                                  controller: controller.tabcontroller,
                                  children: [
                                    GetX<HomeController>(builder: (controller) {
                                      return ListView.builder(
                                          shrinkWrap: true,
                                          itemCount:
                                              controller.restaurants.length,
                                          itemBuilder: (builder, index) {
                                            return (index % 2 == 0)
                                                ? Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          SizedBox(width: 22.w),
                                                          Restaurant(
                                                              controller
                                                                  .restaurants[
                                                                      index]
                                                                  .nom,
                                                              "Asset/Images/Rectangle 13.png",
                                                              controller
                                                                  .restaurants[
                                                                      index]
                                                                  .addresse),
                                                          SizedBox(
                                                            width: 17.w,
                                                          ),
                                                          index <
                                                                  controller
                                                                          .restaurants
                                                                          .length -
                                                                      1
                                                              ? Restaurant(
                                                                  controller
                                                                      .restaurants[
                                                                          index +
                                                                              1]
                                                                      .nom,
                                                                  "Asset/Images/Rectangle 13 (4).png",
                                                                  controller
                                                                      .restaurants[
                                                                          index +
                                                                              1]
                                                                      .addresse)
                                                              : Container(),
                                                          SizedBox(width: 22.w),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 17.h,
                                                      )
                                                    ],
                                                  )
                                                : Container();
                                          });
                                    }),
                                    GetX<HomeController>(builder: (controller) {
                                      return ListView.builder(
                                          itemCount: controller.plats.length,
                                          itemBuilder: (item , index ){
                                            return (index % 2 == 0)
                                                ? Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    SizedBox(width: 22.w),
                                                    Food(
                                                        controller
                                                            .plats[index]
                                                            .nom,
                                                        controller
                                                            .plats[index]
                                                            .description,
                                                        controller
                                                            .plats[index]
                                                            .categorie,
                                                        controller
                                                            .plats[index]
                                                            .prix),
                                                    SizedBox(
                                                      width: 17.w,
                                                    ),
                                                    index <
                                                        controller
                                                            .plats
                                                            .length -
                                                            1
                                                        ? Food(
                                                        controller
                                                            .plats[
                                                        index +
                                                            1]
                                                            .nom,
                                                        controller
                                                            .plats[
                                                        index +
                                                            1]
                                                            .description,
                                                        controller
                                                            .plats[
                                                        index +
                                                            1]
                                                            .categorie,
                                                        controller
                                                            .plats[
                                                        index +
                                                            1]
                                                            .prix)
                                                        : Container(),
                                                    SizedBox(width: 22.w),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 17.h,
                                                )
                                              ],
                                            )
                                                : Container();
                                          }
                                      );
                                    }),
                                    GetX<HomeController>(builder: (controller) {
                                      return ListView.builder(
                                          itemCount: controller.plats.length,
                                          itemBuilder: (item , index ){
                                            return (index % 2 == 0)
                                                ? Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    SizedBox(width: 22.w),
                                                    Food(
                                                        controller
                                                            .plats[index]
                                                            .nom,
                                                        controller
                                                            .plats[index]
                                                            .description,
                                                        controller
                                                            .plats[index]
                                                            .categorie,
                                                        controller
                                                            .plats[index]
                                                            .prix),
                                                    SizedBox(
                                                      width: 17.w,
                                                    ),
                                                    index <
                                                        controller
                                                            .plats
                                                            .length -
                                                            1
                                                        ? Food(
                                                        controller
                                                            .plats[
                                                        index +
                                                            1]
                                                            .nom,
                                                        controller
                                                            .plats[
                                                        index +
                                                            1]
                                                            .description,
                                                        controller
                                                            .plats[
                                                        index +
                                                            1]
                                                            .categorie,
                                                        controller
                                                            .plats[
                                                        index +
                                                            1]
                                                            .prix)
                                                        : Container(),
                                                    SizedBox(width: 22.w),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 17.h,
                                                )
                                              ],
                                            )
                                                : Container();
                                          }
                                      );
                                    }),
                                    Container(
                                      child: AutoSizeText("tab4"),
                                    ),
                                  ]),
                            ),
                          )
                        ]),
                      )
                  ],
                ),
              )
            ])));
  }

  Widget Restaurant(String nom, String photo, String addresse) {
    return GestureDetector(
      onTap: () {
        RestaurantController controller = Get.put(RestaurantController());
        controller.getPlats(nom);

        Get.to(RestaurantScreen(image: photo, name: nom, adress: addresse));
      },
      child: Container(
        height: 196.h,
        width: 149.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 4.h, left: 4.w, right: 4.w),
              height: 118.h,
              width: 141.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(photo), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 8.w,
                ),
                Expanded(
                  child: AutoSizeText(
                    nom,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Color(0xff272727),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 8.w,
                ),
                Expanded(
                  child: AutoSizeText(
                    addresse,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Color(0xff7D7D7D),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget Food(String nom, String description, String categorie, double prix) {
    return Container(
      height: 225.h,
      width: 149.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 4.h, left: 4.w, right: 4.w),
            height: 132.h,
            width: 141.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("Asset/Images/burger4.jpg"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: AutoSizeText(
                  nom,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff272727),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: AutoSizeText(
                  "BK food",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff7D7D7D),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: AutoSizeText(
                  "$prix DA",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff272727),
                  ),
                ),
              ),
              Container(
                height: 30.h,
                width: 30.w,
                margin: EdgeInsets.only(bottom: 4.h, right: 4.w),
                decoration: BoxDecoration(
                  color: Color(0xffFF9900),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
