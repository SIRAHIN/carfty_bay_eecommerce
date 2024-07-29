import 'package:crafty_bay/model/Product%20Card%20View%20Model/porductCardListData.dart';

class CardDataList {
  int? id;
  int? userId;
  int? productId;
  String? color;
  String? size;
  int? qty;
  String? price;
  String? createdAt;
  String? updatedAt;
  ProductCardListData? productCardListData;

  CardDataList(
      {this.id,
      this.userId,
      this.productId,
      this.color,
      this.size,
      this.qty,
      this.price,
      this.createdAt,
      this.updatedAt,
      this.productCardListData});

  CardDataList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    color = json['color'];
    size = json['size'];
    qty = int.tryParse(json['qty']) ?? 1;
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productCardListData =
        json['product'] != null ? ProductCardListData.fromJson(json['product']) : null;
  }

}