import 'package:crafty_bay/model/cart%20model/cart_data_list.dart';

class CartModel {
  String? msg;
  List<CartDataList>? cartDataList;

  CartModel({this.msg, this.cartDataList});

  CartModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      cartDataList = <CartDataList>[];
      json['data'].forEach((v) {
        cartDataList!.add(CartDataList.fromJson(v));
      });
    }
  }


}

