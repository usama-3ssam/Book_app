import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServiceFailuer extends Failure {
  ServiceFailuer(super.errMessage);

  factory ServiceFailuer.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServiceFailuer('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServiceFailuer('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServiceFailuer('Receive timeout with ApiServer');

      case DioExceptionType.badResponse:
        return ServiceFailuer.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServiceFailuer('Request to ApiServer was canceld');

      case DioExceptionType.connectionError:
        if (dioError.message!.contains('SocketException')) {
          return ServiceFailuer('No Internet Connection');
        }
        return ServiceFailuer('Unexpected Error, Please try again!');
      default:
        return ServiceFailuer('Opps There was an Error, Please try again');
    }
  }

  factory ServiceFailuer.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServiceFailuer(response['error']['message']);
    } else if (statusCode == 404) {
      return ServiceFailuer('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServiceFailuer('Internal Server error, Please try later');
    } else {
      return ServiceFailuer('Opps There was an Error, Please try again');
    }
  }
}
