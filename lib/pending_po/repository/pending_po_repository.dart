import "dart:async";
import "dart:io";

import "package:construction_application/api/api.dart";
import "package:construction_application/api/api_request.dart";
import "package:construction_application/api/api_result.dart";
import "package:construction_application/pending_po/model/pending_po_model.dart";
import "package:flutter/material.dart";

class PendingPoApiRepository {
  // Method to call pending PO list API.
  Future<ApiResult<PendingPoModel>> fetchPendingPoList() async {
    final String accessToken = token;

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $accessToken"
    };

    final Map<String, dynamic> requestBody = {
      "companyID": 5,
      "holdRecall": 0,
      "loginID": 141,
      "roleID": 1,
      "supplierIDList": "",
      "poFromDate": "2020-05-02",
      "poToDate": "2025-01-20",
      "projectIDlist": "",
      "skip": 0,
      "limit": 0,
      "deliveryStatus": ""
    };

    final response = await ApiRequests().sendPostRequest(
        headers: headers, url: pendingPoApi, body: requestBody);

    try {
      // Parse and return the response if successful
      debugPrint('${response.statusCode}');
      if (response.statusCode == 200) {
        debugPrint("Response: ${response.body}");
        final jsonString = ApiRequests().returnResponse(response);
        final model = PendingPoModel.fromJson(jsonString);
        return ApiResult(data: model, statusCode: response.statusCode);
      } else if (response.statusCode == 400) {
        return ApiResult(
            errorMessage: "Bad request. Please check your input and try again.",
            statusCode: response.statusCode);
      } else if (response.statusCode == 401) {
        return ApiResult(
            errorMessage: "Unauthorized access. Please log in again.",
            statusCode: response.statusCode);
      } else {
        return ApiResult(
          errorMessage:
              "Unexpected error occurred. Status code: ${response.statusCode}",
          statusCode: response.statusCode,
        );
      }
    } on SocketException {
      // Handles network issues
      return ApiResult(
          errorMessage:
              "No internet connection. Please check your network and try again.",
          statusCode: response.statusCode);
    } on TimeoutException {
      // Handle timeout
      return ApiResult(
          errorMessage: "The request has timed out. Please try again later.",
          statusCode: response.statusCode);
    } on FormatException {
      // Handle JSON formatting issues
      return ApiResult(
          errorMessage: "Invalid response format. Please contact support.",
          statusCode: response.statusCode);
    } catch (e) {
      // Catch any other unexpected errors
      return ApiResult(
          errorMessage: "An unexpected error occurred: ${e.toString()}",
          statusCode: response.statusCode);
    }
  }
}
