import 'package:get/get.dart';
import 'package:order_tracker/order_tracker.dart';

class TrackOrderController extends GetxController{
  int index = 1;
  List<TextDto> enAttente = [
    TextDto("Your order has been placed", "Fri, 25th Mar '22 - 10:47pm"),
    TextDto("Seller ha processed your order", "Sun, 27th Mar '22 - 10:19am"),
  ];

  List<TextDto> enCours = [
    TextDto("Your order has been shipped", "Tue, 29th Mar '22 - 5:04pm"),
    TextDto("Your item has been received in the nearest hub to you.", null),
  ];

  List<TextDto> Livraison= [
    TextDto("Your order is out for delivery", "Thu, 31th Mar '22 - 2:27pm"),
  ];
}