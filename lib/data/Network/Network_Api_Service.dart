import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart%20';
import 'package:saloonstore/data/Network/BaseApi_Services.dart';
import 'package:saloonstore/data/Responces/App_Exception.dart';

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      // ignore: unused_local_variable
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException(
          "No Internet Connection please refrish the page!");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    // ignore: unused_local_variable
    dynamic responseJson;
    try {
      // ignore: unused_local_variable
      Response response = await post(
        Uri.parse(url),
        body: data,
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw BadRewuestException(response.body.toString());
      default:
        throw FetchDataException(
            "Error accoure while communication with serverwith status code ${response.statusCode}");
    }
  }
}


// class ApiService {
//   static Future<List<stores>> fetchAllStores() async {
//     final response = await http.get(Uri.parse(AppUrl.storesEndPoint));

//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       List<stores> stores = data.map((json) => stores.fromJson.(json)).toList();
//       return stores;
//     } else {
//       throw Exception('Failed to load stores');
//     }
//   }
// }
