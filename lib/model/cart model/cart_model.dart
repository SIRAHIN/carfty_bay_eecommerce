import 'package:crafty_bay/model/cart%20model/cart_data_list.dart';

class CartModel {
  String? msg;
  List<CardDataList>? cardDataList;

  CartModel({this.msg, this.cardDataList});

  CartModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      cardDataList = <CardDataList>[];
      json['data'].forEach((v) {
        cardDataList!.add( CardDataList.fromJson(v));
      });
    }
  }


}




