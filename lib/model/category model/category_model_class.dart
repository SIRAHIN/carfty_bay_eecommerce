import 'package:crafty_bay/model/category%20model/category_data_list.dart';

class CategoryModelClass {
  String? msg;
  List<CategoryDataList>? categoryDataList;

  CategoryModelClass({this.msg, this.categoryDataList});

  CategoryModelClass.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      categoryDataList = <CategoryDataList>[];
      json['data'].forEach((v) {
        categoryDataList!.add( CategoryDataList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (categoryDataList != null) {
      data['data'] = categoryDataList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

