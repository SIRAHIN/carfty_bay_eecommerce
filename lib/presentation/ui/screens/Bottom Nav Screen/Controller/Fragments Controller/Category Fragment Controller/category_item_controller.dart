import 'package:crafty_bay/model/category%20model/category_model_class.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/utils/constants/api_urls.dart';
import 'package:get/get.dart';

class CategoryItemController extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  CategoryModelClass _categoryModelClass = CategoryModelClass();

  CategoryModelClass get categoryModelClass => _categoryModelClass;
 


  //Get Category Item Data //
  Future getCategoryListData() async {
    _isLoading = true;
    update();
    final response =
        await NetworkCaller().getRequest(ApiUrls.categoryList);
    if (response.isSuccess) {
       _categoryModelClass = CategoryModelClass.fromJson(response.responseData);
      _isLoading = false;
      update();
    } else {
      _errorMessage = response.errorMessage;
      _isLoading = false;
      update();
    }
  }
   
}