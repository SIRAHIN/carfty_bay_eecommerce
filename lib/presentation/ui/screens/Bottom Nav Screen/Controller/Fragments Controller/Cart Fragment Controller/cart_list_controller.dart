import 'package:crafty_bay/model/cart%20model/cart_model.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/utils/constants/api_urls.dart';
import 'package:crafty_bay/utils/utility/Shared%20Preferences/app_stored_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListController extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  CartModel _cartModelClass = CartModel();

  CartModel get cartModelClass => _cartModelClass;

  @override
  onInit() {
    super.onInit();
    getAddCartListData();
  }

  //Get get Cart List Item Data //
  Future getAddCartListData() async {
    _isLoading = true;
    update();
    final response = await NetworkCaller()
        .getRequest(ApiUrls.cartListUrl, token: AppStoredData.token);
    if (response.isSuccess) {
      _cartModelClass = CartModel.fromJson(response.responseData);
      _isLoading = false;
      update();
    } else {
      _errorMessage = response.errorMessage;
      _isLoading = false;
      update();
    }
  }

  // Cart Item Delete Function //
  Future deleteItemFromCartById(String productId) async {
    final response =
        await NetworkCaller().getRequest(ApiUrls.deleteCartItembyId(productId));
    if (response.isSuccess) {
      await getAddCartListData();
    } else {
      Get.snackbar(
        'Oops',
        "Product Can't delete",
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
        icon: const Icon(Icons.add_alert),
      );
      _errorMessage = response.errorMessage;
    }
  }
}
