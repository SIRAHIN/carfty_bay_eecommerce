
import 'package:crafty_bay/model/Product%20Details%20Model/proddut_details_data_list.dart';

class ProductDetailsModel {
  String? msg;
  List<ProductDetailsDataList>? productDetailsListData;

  ProductDetailsModel({this.msg, this.productDetailsListData});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      productDetailsListData = <ProductDetailsDataList>[];
      json['data'].forEach((v) {
        productDetailsListData!.add( ProductDetailsDataList.fromJson(v));
      });
    }
  }

 
}





