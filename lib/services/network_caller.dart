import 'dart:convert';
import 'dart:developer';

import 'package:crafty_bay/model/responseData_model.dart';
import 'package:http/http.dart' as http;

class NetworkCaller {
  Future<ResponsedataModel> getRequest(String url, {String? token}) async {
  log(url);
    final http.Response response = await http
        .get(Uri.parse(url), headers: {'Content-type': 'application/json'});
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      if (decodedResponse['msg'] == 'success') {
        return ResponsedataModel(
            isSuccess: true,
            statusCode: response.statusCode,
            responseData: decodedResponse);
      } else {
        return ResponsedataModel(
            isSuccess: false,
            statusCode: response.statusCode,
            responseData: decodedResponse['data'] ?? 'Something went Wrong');
      }
    } else {
      return ResponsedataModel(
          isSuccess: false, statusCode: response.statusCode, responseData: '');
    }
  }
}
