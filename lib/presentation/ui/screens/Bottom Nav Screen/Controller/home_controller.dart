import 'package:crafty_bay/utils/constants/asset_paths.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int _currentIndex = 0;
  final List<String> _imageUrls = [
    AssetPaths.carouselImage,
    AssetPaths.carouselImage,
    AssetPaths.carouselImage,
    AssetPaths.carouselImage,
  ];

   int get currentIndex => _currentIndex;

   List get imageUrls => _imageUrls;

   void onChangeIndex(indexValue){
    _currentIndex = indexValue;
    update();
   }
}