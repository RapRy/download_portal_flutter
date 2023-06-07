import 'package:dio/dio.dart';

const errorRequestCancelled = 'errorRequestCancelled';
const errorConnectionTimeout = 'errorConnectionTimeout';
const errorInternetConnection = 'errorInternetConnection';
const errorReceiveTimeout = 'errorReceiveTimeout';
const errorSendTimeout = 'errorSendTimeout';
const errorBadRequest = 'errorBadRequest';
const errorRequestNotFound = 'errorRequestNotFound';
const errorIntenalServer = 'errorIntenalServer';
const errorSomethingWentWrong = 'errorSomethingWentWrong';

class DataException implements Exception {
  String message = "";

  DataException({required this.message});

  DataException.fromDioError(DioError dioError, String errorMessage) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = errorRequestCancelled;
        break;
      case DioErrorType.connectionTimeout:
        message = errorConnectionTimeout;
        break;
      case DioErrorType.receiveTimeout:
        message = errorReceiveTimeout;
        break;
      case DioErrorType.badResponse:
        // message = _handleError(dioError.response!.statusCode!);
        message = errorMessage;
        break;
      case DioErrorType.sendTimeout:
        message = errorSendTimeout;
        break;
      default:
        message = errorInternetConnection;
        break;
    }
  }

  String _handleError(int statusCode) {
    switch (statusCode) {
      case 400:
        return errorBadRequest;
      case 404:
        return errorRequestNotFound;
      case 500:
        return errorIntenalServer;
      default:
        return errorSomethingWentWrong;
    }
  }

  @override
  String toString() => message;
}
