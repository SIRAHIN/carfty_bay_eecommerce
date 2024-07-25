import 'package:crafty_bay/model/Product%20Card%20View%20Model/productCardViewModel.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/utils/constants/api_urls.dart';
import 'package:get/get.dart';

class SpecialProductLsitController extends GetxController {
 bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  ProductCardViewModel _productCardViewModelClass = ProductCardViewModel();

  ProductCardViewModel get productCardViewModelClass => _productCardViewModelClass;

  


  //Get Product Card for Speical // 
  Future getProductByRemark() async {

    _isLoading = true;
    update();
    final response =
        await NetworkCaller().getRequest('${ApiUrls.ListProductByRemarkurl}special');
    if (response.isSuccess) {
       _productCardViewModelClass = ProductCardViewModel.fromJson(response.responseData);
      _isLoading = false;
      update();
    } else {
      _errorMessage = response.errorMessage;
      _isLoading = false;
      update();
    }
  }

}