import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class OTPController extends GetxController {

  bool submit1 = false;
  bool submit2 = false;
  bool submit3 = false;
  bool submit4 = false;
  bool submit5 = false;
  bool submit6 = false;
  String code ="";
  final digitCode1 = new TextEditingController();
  final digitCode2 = new TextEditingController();
  final digitCode3 = new TextEditingController();
  final digitCode4 = new TextEditingController();
  final digitCode5 = new TextEditingController();


  void onSubmitOTP() {
  /*  submit1 = digitCode1.text.isNotEmpty;
    submit2 = digitCode2.text.isNotEmpty;
    submit3 = digitCode3.text.isNotEmpty;
    submit4 = digitCode4.text.isNotEmpty;
    submit5 = digitCode5.text.isNotEmpty;*/
    code = digitCode1.text+digitCode2.text+digitCode3.text+digitCode4.text+digitCode5.text;
    submit1 = code.length==5 ;

    update();
  }
}