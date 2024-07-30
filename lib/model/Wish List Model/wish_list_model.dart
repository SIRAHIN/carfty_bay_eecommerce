import 'package:crafty_bay/model/Wish%20List%20Model/wish_data_list.dart';

class WishListModel {
  String? msg;
  List<WishListData>? wishDataList;

  WishListModel({this.msg, this.wishDataList});

  WishListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      wishDataList = <WishListData>[];
      json['data'].forEach((v) {
        wishDataList!.add(WishListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (wishDataList != null) {
      data['data'] = wishDataList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

