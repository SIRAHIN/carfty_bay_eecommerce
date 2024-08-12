
import 'package:crafty_bay/model/cart%20model/cart_data_list.dart';
import 'package:crafty_bay/model/cart%20model/cart_model.dart';
import 'package:crafty_bay/presentation/ui/screens/Product%20Screen/Controller/product_add_to_cart_controller.dart';
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

  void increasedQuantity({required int productID, required String productColor, required String productSize}) {
  _cartModelClass.cardDataList?.forEach((element) {
    if (element.productId == productID) {
      // Safeguard against null qty
      element.qty = (element.qty ?? 0) + 1;
      Get.find<ProductAddToCartController>().addTOcart(productID, quantity: element.qty, productColor: productColor, productSize: productSize);
      update();
    }
  });
}

void decreasedQuantity({required int productID, required String productColor, required String productSize}) {
  _cartModelClass.cardDataList?.forEach((element) {
    if (element.productId == productID) {
      // Safeguard against null qty and ensure qty doesn't go below 1
      if (element.qty != null && element.qty! > 1) {
        element.qty = (element.qty ?? 0) - 1;
        Get.find<ProductAddToCartController>().addTOcart(productID, quantity: element.qty, productColor: productColor, productSize: productSize);
      } else {
        deleteItemFromCartById(productID.toString());
      }
      update();
    }
  });
}

double get totalPrice {
   double total = 0.0;
  for (CardDataList item in _cartModelClass.cardDataList ?? []) {
    // Ensure price and quantity are not null before calculation
    double price = double.tryParse(item.price ?? '0.0') ?? 0.0;
    int qty = item.qty ?? 0;
    total += price * qty;
    // Debugging output
    print('Item: ${item.productId}, Price: $price, Quantity: $qty, Total so far: $total');
  }
  // Final total debugging output
  print('Total Price: $total');
  return total;
}

  // void increasedQuantity({required int productID, required String productColor, required String porductSize}) {
  //   _cartModelClass.cardDataList?.forEach((element) {
  //     if (element.productId == productID) {
  //       element.qty = (element.qty!) + 1;
  //       Get.find<ProductAddToCartController>().addTOcart(productID, quantity: element.qty, productColor: productColor, productSize:porductSize );
  //       update();
  //     }
  //   });
  // }

  // void decreasedQuantity({required int productID, required String productColor, required String porductSize}) {
  //   _cartModelClass.cardDataList?.forEach((element) {
  //     if (element.productId == productID) {
  //       element.qty = (element.qty!) - 1;
  //       Get.find<ProductAddToCartController>().addTOcart(productID, quantity: element.qty, productColor: productColor, productSize:porductSize );
  //       if (((element.qty)! < 1)) {
  //         deleteItemFromCartById(productID.toString());
  //       }
  //       update();
  //     }
  //   });
  // }

  // double get totalPrice {
  //   double total = 0.0;
  //   for (CardDataList item in cartModelClass.cardDataList ?? []) {
  //     total += ((double.tryParse("${item.price}")! * (item.qty!)));

  //     //total += double.tryParse(item.price!)!;
  //   }
  //   // update();
  //   return total;
  // }
}
