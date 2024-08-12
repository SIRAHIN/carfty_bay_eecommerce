class ReviewersProfileData {
  int? id;
  String? cusName;

  ReviewersProfileData({this.id, this.cusName});

  ReviewersProfileData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cusName = json['cus_name'];
  }

}