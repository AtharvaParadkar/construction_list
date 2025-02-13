import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_exceptions.dart';

class ApiRequests {
  Future<http.Response> sendPostRequest(
      {required String url,
      required Map<String, dynamic>? body,
      required Map<String, String>? headers}) async {
    final Uri uri = Uri.parse(url);
    final http.Response response;
    response = await http.Client().post(
      uri,
      headers: headers,
      body: json.encode(body),
      encoding: Encoding.getByName('utf-8'),
    );
    return response;
  }

  Future<http.Response> sendGetRequest(
    String url, {
    Map<String, String>? headers,
  }) async {
    final Uri uri = Uri.parse(url);
    final http.Response response;
    response = await http.Client().get(uri, headers: headers);
    return response;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return json.decode(response.body);
      case 403:
        return json.decode(response.body);
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorizedException(response.body.toString());
      default:
        FetchDataException(
            'Error while Communication with status code${response.statusCode}');
    }
  }
}
