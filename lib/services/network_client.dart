import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pokedex/services/app_exceptions.dart';

class NetworkClient{
  static const int timeOutDuration = 20;

  Future<dynamic> get(String baseUrl, String api) async {
    log('Api Get, url ${Uri.parse(baseUrl + api)}');

    try {
      var response = await http
          .get(Uri.parse(baseUrl + api))
          .timeout(const Duration(seconds: timeOutDuration));
      return returnResponse(response);
    } on SocketException {
      throw const SocketException(
        'No Internet connection',
      );
    } catch (e) {
      throw AppExceptions(
        e.toString(),
        "Exception",
      );
    }
  }

  //RESPONSE
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return json.decode(response.body);
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occur while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  //HANDLE ERROR
  void handleError(error) {
    // hideLoading();
    if (error is BadRequestException) {
    } else if (error is FetchDataException) {
    } else if (error is SocketException) {
    } else if (error is ApiNotRespondingException) {
    } else {

    }
  }
}