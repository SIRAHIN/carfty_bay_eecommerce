// ignore_for_file: file_names

class ApiUrls {
 
static const String baseUrl = 'https://craftybay.teamrabbil.com/api';

static String sentEmailOtpUrl(String email) => '$baseUrl/UserLogin/$email';

}