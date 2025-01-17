import 'package:crafty_bay/model/Product%20Card%20View%20Model/porductCardListData.dart';

class WishListData {
  int? id;
  int? productId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  ProductCardListData? product;

  WishListData(
      {this.id,
      this.productId,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.product});

  WishListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
        json['product'] != null ? ProductCardListData.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

