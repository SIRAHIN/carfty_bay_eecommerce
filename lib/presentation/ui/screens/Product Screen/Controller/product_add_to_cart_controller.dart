
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/utils/constants/api_urls.dart';
import 'package:crafty_bay/utils/utility/Shared%20Preferences/app_stored_data.dart';
import 'package:get/get.dart';

class ProductAddToCartController extends GetxController {
  
  bool _isProgress = false;
  bool get isProgress => _isProgress;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<bool> addTOcart(int productId, {String? productColor, String? productSize, int? quantity}) async{
   _isProgress = true;
   update();
   Map<String, dynamic> inputParams ={
    "product_id": productId,
    "color": productColor,
    "size": productSize,
    "qty" : quantity
   };
   final reponse = await NetworkCaller().postRequest(ApiUrls.addTocartUrl, AppStoredData.token, inputParams);
   if(reponse.isSuccess){
    _isProgress = false;
    update();
    return true;
   } else{
    _errorMessage = reponse.errorMessage;
   }
   _isProgress = false;
   update();
   return false;
  }

  

  // product Count Increase and Decrease Functions //
  int itemOfProduct = 1;

  productCountIncrease(){
   // code to increase product count
   itemOfProduct += 1;
   update();
  }

   productCountDecrease(){
   // code to increase product count
   if(itemOfProduct <= 1){
    itemOfProduct = 1;
    update();
   } else {
    itemOfProduct -= 1;
    update();
   }
  }


}