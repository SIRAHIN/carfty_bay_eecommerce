class UserProfileData {
  int? id;
  String? customerFullName;
  String? customerAddress;
  String? customerCity;
  String? customerState;
  String? customerPhoneNumber;
  String? shippingAddress;
  String? shippingPhoneNumber;
  String? createdAt;
  String? updatedAt;

  UserProfileData(
      {this.id,
      this.customerFullName,
      this.customerAddress,
      this.customerCity,
      this.customerPhoneNumber,
      this.shippingAddress,
      this.customerState,
      this.shippingPhoneNumber,
      this.createdAt,
      this.updatedAt});

  UserProfileData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerFullName = json['cus_name'];
    customerAddress = json['cus_add'];
    customerCity = json['cus_city'];
    customerState = json['cus_state'];
    customerPhoneNumber = json['cus_phone'];
    shippingAddress = json['ship_add'];
    shippingPhoneNumber = json['ship_phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cus_name'] = customerFullName;
    data['cus_add'] = customerAddress;
    data['cus_city'] = customerCity;
    data['cus_state'] = customerState;
    data['cus_phone'] = customerPhoneNumber;
    data['ship_add'] = shippingAddress;
    data['ship_phone'] = shippingPhoneNumber;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
