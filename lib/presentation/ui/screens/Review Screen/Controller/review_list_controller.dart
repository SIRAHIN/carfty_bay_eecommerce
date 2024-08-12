import 'package:crafty_bay/model/Review%20Model/review_model.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/utils/constants/api_urls.dart';
import 'package:get/get.dart';

class ReviewListController extends GetxController {

    bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  ReviewModel _reviewModel = ReviewModel();

  ReviewModel get reviewModelData => _reviewModel;


  //Get review of Product Data// 
  Future getReviwListByProductId({required String productID}) async {
    _isLoading = true;
    update();
    final response =
        await NetworkCaller().getRequest(ApiUrls.reviewByProductId(productID));
    if (response.isSuccess) {
       _reviewModel = ReviewModel.fromJson(response.responseData);
      _isLoading = false;
      update();
    } else {
      _errorMessage = response.errorMessage;
      _isLoading = false;
      update();
    }
  }
}