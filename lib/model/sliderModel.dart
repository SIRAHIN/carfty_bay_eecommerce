// ignore: file_names
import 'package:crafty_bay/model/sliderDataList.dart';

class SliderModel {
  String? msg;
  List<SliderDataList>? sliderDataList;

  SliderModel({this.msg,  this.sliderDataList});

  SliderModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      sliderDataList = <SliderDataList>[];
      json['data'].forEach((v) {
        sliderDataList!.add(SliderDataList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['msg'] = msg;
    if (sliderDataList != null) {
      data['data'] = sliderDataList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

