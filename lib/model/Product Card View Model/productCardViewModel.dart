import 'package:crafty_bay/model/Product%20Card%20View%20Model/porductCardListData.dart';


class ProductCardViewModel {
  String? msg;
  List<ProductCardListData>? productCardListData;

  ProductCardViewModel({this.msg, this.productCardListData});

  ProductCardViewModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      productCardListData = <ProductCardListData>[];
      json['data'].forEach((v) {
        productCardListData!.add(ProductCardListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (productCardListData != null) {
      data['data'] = productCardListData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}






