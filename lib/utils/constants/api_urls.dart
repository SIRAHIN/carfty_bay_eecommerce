// ignore_for_file: file_names

class ApiUrls {
 
static const String baseUrl = 'https://craftybay.teamrabbil.com/api';

static String sentEmailForOtpUrl(String email) => '$baseUrl/UserLogin/$email';

static String verifyOtpforEmail(String email, String otp) => '$baseUrl/VerifyLogin/$email/$otp';

static String readUserProfileUrl = '$baseUrl/ReadProfile';

static String createUserProfileUrl = '$baseUrl/CreateProfile';

static String listProductSlider = '$baseUrl/ListProductSlider';

static String categoryList = '$baseUrl/CategoryList';

static String productByCategoryId(String categoryid) => '$baseUrl/ListProductByCategory/$categoryid';

static String ListProductByRemarkurl = '$baseUrl/ListProductByRemark/';


}