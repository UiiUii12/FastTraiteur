import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ConfirmeOrderController extends GetxController {

  TextEditingController localisation = TextEditingController(text: "Sidi Bel Abbes, Algerie");
  RxBool edit = false.obs ;
  TextEditingController message = TextEditingController() ;

}