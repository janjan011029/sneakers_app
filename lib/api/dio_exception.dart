import 'dart:io';

import 'package:dio/dio.dart';

class DioException implements Exception {
  late String errMsg;

  DioException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.badResponse:
        final statusCode = dioError.response?.statusCode;
        final msg = dioError.response?.data is Map<String, dynamic>
            ? dioError.response?.data['message']
            : 'Domain does not exist.';

        errMsg = _handleBadResponse(statusCode, msg);
        break;
      case DioErrorType.unknown:
        if (dioError.error is SocketException) {
          errMsg = 'No internet connection.';
          break;
        }
        errMsg = 'Unexpected error occurred.';
        break;
      default:
        errMsg = 'Something went wrong.';
        break;
    }
  }

  String _handleBadResponse(int? statusCode, String msg) {
    switch (statusCode) {
      case 400:
        return msg;
      case 401:
        return msg;
      case 403:
        return msg;
      case 404:
        return msg;
      case 405:
        return msg;
      case 415:
        return msg;
      case 422:
        return msg;
      case 429:
        return msg;
      case 500:
        return msg;
      default:
        return 'Oops something went wrong!';
    }
  }

  @override
  String toString() => errMsg;
}
