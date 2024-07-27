import 'package:crafty_bay/model/Product%20Card%20View%20Model/porductCardListData.dart';

class CartDataList {
  int? id;
  String? email;
  int? productId;
  String? color;
  String? size;
  String? createdAt;
  String? updatedAt;
  ProductCardListData? product;

  CartDataList(
      {this.id,
      this.email,
      this.productId,
      this.color,
      this.size,
      this.createdAt,
      this.updatedAt,
      this.product});

  CartDataList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    productId = json['product_id'];
    color = json['color'];
    size = json['size'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product = json['product'];
  }
}