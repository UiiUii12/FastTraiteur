import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart';
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
  Future<String> CreateUser() async{
    final Response response = await post(
      Uri.parse("http://192.168.43.38:8000/register/") ,
        headers: <String,String>{
        'Content-Type':'application/json;charset=UTF-8'
      },
      body: jsonEncode(<String , String>{
        "phone_number" : "+213${phoneNumber.text.substring(1)}" ,
      })
    );

    if(response.statusCode == 200) {
      print("////////////////////////////////////");
      return jsonDecode(response.body);
    }
    else {
      print("0000000000000000000000000000000000000000000000");
      print(response.statusCode);
      throw Exception("Mafihaaaaaaaaaaaaaaaaaaaaaaach");
    }
  }

}