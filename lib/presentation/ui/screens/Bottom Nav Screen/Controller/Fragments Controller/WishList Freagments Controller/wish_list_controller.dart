import 'package:crafty_bay/model/Wish%20List%20Model/wish_list_model.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/utils/constants/api_urls.dart';
import 'package:crafty_bay/utils/utility/Shared%20Preferences/app_stored_data.dart';
import 'package:crafty_bay/utils/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {


  String _errorMessage = '';

  String get errorMessage => _errorMessage;


  bool _isLoading = false;

  bool get isLoading => _isLoading;


  WishListModel _wishListModel = WishListModel();

  WishListModel get wishListModel => _wishListModel;

  @override
  onInit() {
    super.onInit();
    getWishListData();
  }

  //Get Wish List Item Data //
  Future getWishListData() async {
    _isLoading = true;
    update();
    final response = await NetworkCaller()
        .getRequest(ApiUrls.wishListUrl, token: AppStoredData.token);
    if (response.isSuccess) {
      _wishListModel = WishListModel.fromJson(response.responseData);
      _isLoading = false;
      update();
    } else {
      _errorMessage = response.errorMessage;
      _isLoading = false;
      update();
    }
  }




  // Wish Item Add Function //
  Future addWishListByID(String productId) async {
    final response =
        await NetworkCaller().getRequest(ApiUrls.addWishListbyId(productId));
    if (response.isSuccess) {
      Get.snackbar(
        'Success',
        "Wish Product Added",
        colorText: Colors.black,
        backgroundColor: AppColors.primaryColor,
        icon: const Icon(Icons.add_alert),
      );
    
    } else {
      Get.snackbar(
        'Oops',
        "Wish Product Can't Added",
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
        icon: const Icon(Icons.add_alert),
      );
      _errorMessage = response.errorMessage;
    }
  }


 // Wish Item remove Function //
  Future removedWishListByID(String productId) async {
    final response =
        await NetworkCaller().getRequest(ApiUrls.removeWishListbyId(productId));
    if (response.isSuccess) {
      Get.snackbar(
        'Success',
        "Wish Product removed",
        colorText: Colors.black,
        backgroundColor: AppColors.primaryColor,
        icon: const Icon(Icons.add_alert),
      );
      await getWishListData();
    } else {
      Get.snackbar(
        'Oops',
        "Wish Product Can't removed",
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
        icon: const Icon(Icons.add_alert),
      );
      _errorMessage = response.errorMessage;
    }
  }


}