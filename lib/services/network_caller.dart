import 'dart:convert';
import 'dart:developer';

import 'package:crafty_bay/model/Response%20Data%20Model/responseData_model.dart';
import 'package:crafty_bay/utils/utility/Shared%20Preferences/app_stored_data.dart';
import 'package:http/http.dart' as http;

class NetworkCaller {
  Future<ResponsedataModel> getRequest(String url, {String? token}) async {
  
    final http.Response response = await http
        .get(Uri.parse(url), 
        headers: {
        'Content-type': 'application/json',
        'token' : AppStoredData.token ?? token.toString()
        }

        );
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      if (decodedResponse['msg'] == 'success') {
      // print(decodedResponse['data'][0]);
        print(decodedResponse['data']);
        return ResponsedataModel(
            isSuccess: true,
            statusCode: response.statusCode,
            responseData: decodedResponse
            );
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


  Future<ResponsedataModel> postRequest(String url, String? token, Map<String, dynamic> body) async {
  log(url);
    final http.Response response = await http
        .post(Uri.parse(url), 
        headers: {
        'Content-type': 'application/json',
        'token' : token.toString()
        },
        body: jsonEncode(body)
        );
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
