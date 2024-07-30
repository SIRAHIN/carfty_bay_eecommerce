import 'package:crafty_bay/model/Review%20Model/review_data_list.dart';

class ReviewModel {
  String? msg;
  List<ReviewDataList>? reviewDataList;

  ReviewModel({this.msg, this.reviewDataList});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      reviewDataList = <ReviewDataList>[];
      json['data'].forEach((v) {
        reviewDataList!.add(new ReviewDataList.fromJson(v));
      });
    }
  }

}



