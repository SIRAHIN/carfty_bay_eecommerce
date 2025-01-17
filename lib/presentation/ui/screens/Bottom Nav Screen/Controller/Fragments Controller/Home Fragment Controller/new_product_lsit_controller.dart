import 'package:crafty_bay/model/Product%20Card%20View%20Model/productCardViewModel.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/utils/constants/api_urls.dart';
import 'package:get/get.dart';

class NewProductLsitController extends GetxController {
 bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  ProductCardViewModel _productCardViewModelClass = ProductCardViewModel();

  ProductCardViewModel get productCardViewModelClass => _productCardViewModelClass;

  //  List<CategoryDataList> categoryDatalsit = [];


  //Get Product Card View Data// 
  Future getProductByRemark() async {

    _isLoading = true;
    update();
    final response =
        await NetworkCaller().getRequest('${ApiUrls.ListProductByRemarkurl}new');
    if (response.isSuccess) {
       _productCardViewModelClass = ProductCardViewModel.fromJson(response.responseData);
      //  for(var i in categoryModelClass.categoryDataList!){
      //   categoryDatalsit.add(i);
      //  }
      _isLoading = false;
      update();
    } else {
      _errorMessage = response.errorMessage;
      _isLoading = false;
      update();
    }
  }

}