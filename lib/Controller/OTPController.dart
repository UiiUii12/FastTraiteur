import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart';

class OTPController extends GetxController {

  bool submit = false;


  String code ="";
  final digitCode1 = new TextEditingController();
  final digitCode2 = new TextEditingController();
  final digitCode3 = new TextEditingController();
  final digitCode4 = new TextEditingController();
  final digitCode5 = new TextEditingController();

//


  void onSubmitOTP() {

    code = digitCode1.text+digitCode2.text+digitCode3.text+digitCode4.text+digitCode5.text;
    submit = code.length==5 ;

    update();
  }
  Future<String> CreateUser() async{
    final Response response = await post(
        Uri.parse("http://192.168.43.38:8000/otpverify/") ,
        headers: <String,String>{
          'Content-Type':'application/json;charset=UTF-8'
        },
        body: jsonEncode(<String , String>{
          "otp" : code,
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