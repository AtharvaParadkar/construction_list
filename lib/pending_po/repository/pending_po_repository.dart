import "dart:async";
import "dart:convert";
import "dart:io";

import "package:construction_application/api/api.dart";
import "package:construction_application/pending_po/model/pending_po_model.dart";
import "package:http/http.dart" as http;

class PendingPoApiRepository {
  Future<List<PendingPoModel>> fetchPendingPo() async {
    final url = Uri.parse(pendingPoApi);
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((e) => PendingPoModel.fromJson(e)).toList();
      } else if (response.statusCode == 400) {
        throw Exception('Bad request. Please check your input and try again.');
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized access. Please log in again.');
      } else {
        throw Exception(
            'Unexpected error occurred. Status code: ${response.statusCode}');
      }
    } on SocketException {
      // Handles network issues
      throw Exception(
          'No internet connection. Please check your network and try again.');
    } on TimeoutException {
      // Handle timeout
      throw Exception('The request has timed out. Please try again later.');
    } on FormatException {
      // Handle JSON formatting issues
      throw Exception('Invalid response format. Please contact support.');
    } catch (error) {
      throw Exception(error);
    }
  }
}
