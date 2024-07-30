// ignore_for_file: file_names

class ApiUrls {
  static const String baseUrl = 'http://ecom-api.teamrabbil.com/api';

  static String sentEmailForOtpUrl(String email) => '$baseUrl/UserLogin/$email';

  static String verifyOtpforEmail(String email, String otp) =>
      '$baseUrl/VerifyLogin/$email/$otp';

  static String readUserProfileUrl = '$baseUrl/ReadProfile';

  static String createUserProfileUrl = '$baseUrl/CreateProfile';

  static String listProductSlider = '$baseUrl/ListProductSlider';

  static String categoryList = '$baseUrl/CategoryList';

  static String productByCategoryId(String categoryid) =>
      '$baseUrl/ListProductByCategory/$categoryid';

// ignore: non_constant_identifier_names
  static String ListProductByRemarkurl = '$baseUrl/ListProductByRemark/';

  static String productDetailsByProductId(String productId) =>
      '$baseUrl/ProductDetailsById/$productId';

  static String addTocartUrl = '$baseUrl/CreateCartList';

  static String cartListUrl = '$baseUrl/CartList';

  static String wishListUrl = '$baseUrl/ProductWishList';

  static String deleteCartItembyId(String productId) =>
      '$baseUrl/DeleteCartList/$productId';

  static String addWishListbyId(String productId) =>
      '$baseUrl/CreateWishList/$productId';

  static String removeWishListbyId(String productId) =>
      '$baseUrl/RemoveWishList/$productId';

  static String createProductReviewUrl = '$baseUrl/CreateProductReview';
  static String reviewByProductId(String productID) =>
      '$baseUrl/ListReviewByProduct/$productID';
}
