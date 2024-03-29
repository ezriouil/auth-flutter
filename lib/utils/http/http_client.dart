import 'dart:convert';

import 'package:flutter_node_js/utils/constants/custom_api.dart';
import 'package:http/http.dart' as http;

class Http {
  Http._();

  /// GET
  static Future<dynamic> get(String endPoint) async {
    final Uri uri = Uri.parse(CustomApi.BASE_URL + endPoint);
    final response = await http.get(uri);
    return response;
  }

  /// POST
  static Future<http.Response> post({ required String endPoint, required Map<String, dynamic> body}) async {
    Uri uri = Uri.parse(CustomApi.BASE_URL + endPoint);
    final response = await http.post(uri,
        headers: {"Content-Type": "application/json ; charset=UTF-8"},
        body: jsonEncode(body)
    );
    return response;
  }

  /// POST
  static Future<http.Response> put({ required String endPoint, required Map<String, dynamic> body, Map<String, String>? headers}) async {
    Uri uri = Uri.parse(CustomApi.BASE_URL + endPoint);
    final response = await http.put(uri,
        headers: headers ?? {"Content-Type": "application/json ; charset=UTF-8"},
        body: jsonEncode(body)
    );
    return response;
  }

  /// DELETE
  static Future<dynamic> delete(String endPoint) async {
    try {
      Uri uri = Uri.parse(CustomApi.BASE_URL + endPoint);
      final response = await http.delete(
        uri,
        headers: {"Content-Type": "application/json ; charset=UTF-8"},
      );
      return response;
    } catch (error) {
      return error;
    }
  }
}
