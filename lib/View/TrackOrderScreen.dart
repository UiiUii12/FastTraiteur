import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:order_tracker/order_tracker.dart';
import '../Controller/TrackOrderController.dart';


class TrackOrderScreen extends StatelessWidget {
  TrackOrderScreen({Key? key}) : super(key: key);
  TrackOrderController controller =Get.put(TrackOrderController(),permanent: true);
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF3F3F3),
      appBar: PreferredSize(
        preferredSize:Size.fromHeight(70.h),
        child: AppBar(
          title: AutoSizeText('Suivi de commande'),
          backgroundColor: Color(0XFF272727),
          elevation: 0,
          leading: IconButton(
            icon: SvgPicture.asset('Asset/Images/BackIcon.svg'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
        ),
      ),
      body:Theme(
        data:  ThemeData(
            colorScheme: ColorScheme.light(
                primary: Color(0XFFFF9900),
            )
        ),
        child: Column(
          children: [
            Container(
                height: 200.h,
                width: 200.w,
                child: SvgPicture.asset('Asset/Images/track1.svg')),
            Stepper(
            controlsBuilder: (context, controller) {
              return  SizedBox.shrink();
            },
          currentStep:controller.index,
          steps: <Step>[
            Step(
              title:AutoSizeText('Commande en attente'),
              content: Container(),
              isActive:controller.index==0,
            ),
            Step(
              title:AutoSizeText('Commande en cours de preparation'),
              content: Container(),
              isActive: controller.index==1,
            ),
            Step(
              title:AutoSizeText('Commande en cours de livraison'),
              content: Container(),
              isActive:controller.index==2,
            ),
          ],
        )

        ],
        ),
      )
    );
  }

}
