import 'package:crafty_bay/model/Slider%20Model/sliderModel.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/utils/constants/api_urls.dart';
import 'package:get/get.dart';

class BannerSliderController extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  SliderModel _sliderModelData = SliderModel();

  SliderModel get sliderModel => _sliderModelData;


  //Get banner Slider Data 
  Future getSliderData() async {
    _isLoading = true;
    update();
    final response =
        await NetworkCaller().getRequest(ApiUrls.listProductSlider);
    if (response.isSuccess) {
       _sliderModelData = SliderModel.fromJson(response.responseData);
      _isLoading = false;
      update();
    } else {
      _errorMessage = response.errorMessage;
      _isLoading = false;
      update();
    }
  }
   
   // Controller Slider Pin Point Index //
   int _currentIndex = 0;

   int get currentIndex => _currentIndex;

   void onChangeIndex(indexValue){
    _currentIndex = indexValue;
    update();
   }
  
  

}
