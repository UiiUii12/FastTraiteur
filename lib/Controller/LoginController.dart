import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginController extends GetxController {
  final phoneNumber= new TextEditingController();
  bool submit1=false;

  void onClose() {
    phoneNumber.dispose();
    super.onClose();
  }
  void onSubmitLogin() {
    submit1=phoneNumber.text.length==10;
    update();
  }
}