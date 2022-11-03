//DIO ERROR RETURN
import '../../model/error_entity.dart';
import 'package:dio/dio.dart';
import 'dio_error_message.dart';

createErrorEntity(DioError error) {
  switch (error.type) {
    case DioErrorType.cancel:
      {
        return const ErrorEntity(code: -1, message: requestCancelError);
      }
    case DioErrorType.connectTimeout:
      {
        return const ErrorEntity(code: -1, message: connectionTimeOutError);
      }

    case DioErrorType.sendTimeout:
      {
        return const ErrorEntity(code: -1, message: requestTimeOutError);
      }
    case DioErrorType.receiveTimeout:
      {
        return const ErrorEntity(code: -1, message: responseTimeOutError);
      }
    case DioErrorType.other:
      {
        return const ErrorEntity(
            code: 0, message: checkInternetConnectionError);
      }
    case DioErrorType.response:
      {
        try {
          int? errCode = error.response!.statusCode;
          switch (errCode) {
            case 400:
              return ErrorEntity(code: errCode!, message: requestSyntaxError);
            case 403:
              return ErrorEntity(code: errCode!, message: serverRefusedError);
            case 404:
              return ErrorEntity(code: errCode!, message: dataNotAvailableError);
            case 405:
              return ErrorEntity(code: errCode!, message: requestForbiddenError);
            case 500:
              return ErrorEntity(code: errCode!, message: serverInternalError);
              case 502:
              return ErrorEntity(code: errCode!, message: invalidRequestError);
            case 503:
              return ErrorEntity(code: errCode!, message: serverDownError);
            case 505:
              return ErrorEntity(code: errCode!, message: notSupportHTTPError);
            default:
              return ErrorEntity(code: errCode!, message: unknownMistakeError);
          }
        } on Exception catch (_) {
          return const ErrorEntity(code: -1, message: unknownError);
        }
      }
    default:
      return ErrorEntity(code: -1, message: error.message);
  }
}
