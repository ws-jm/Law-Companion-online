import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import '../../resource/enum.dart';
import 'dio_error.dart';
import 'package:flutter/foundation.dart';
import '../../model/error_entity.dart';

const _apiTypeCollection = {
  ApiTypeEnum.get: 'get',
  ApiTypeEnum.post: 'post',
  ApiTypeEnum.delete: 'delete',
  ApiTypeEnum.put: 'put'
};

typedef HttpSuccessCallback<T> = void Function(T data);
typedef HttpFailureCallback = void Function(ErrorEntity? data);
typedef ProgressCallback = void Function(int count, int total);

CancelToken cancelToken = CancelToken();

_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

/*
  FormData formData = new FormData.fromMap({
    "name": "",
    "age": 1,
     "file": await MultipartFile.fromFile("./developerlibs.txt", filename: "developerlibs.txt"),
  });
*/

class DioHelper {
  Dio _dio;

  DioHelper(this._dio);

  Future request<T>(
    String baseUrl, {
    ApiTypeEnum apiTypeEnum = ApiTypeEnum.get,
    String path = '',
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? headers,
    HttpSuccessCallback<T>?
        success, //STREAM CALL required HttpSuccessCallback<Stream> success
    required HttpFailureCallback error,
  }) async {
    try {
      BaseOptions baseOptions = BaseOptions(
          baseUrl: baseUrl,
          receiveDataWhenStatusError: false,
          responseType: ResponseType.json,
          connectTimeout: 60000,
          receiveTimeout: 60000,
          headers: headers);

      _dio = Dio(baseOptions)..interceptors.addAll(logInterceptor());

      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };

      //FEATURE DATA
      (_dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;

      var response = await _dio.request(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
            method:
                _apiTypeCollection[apiTypeEnum]), /*cancelToken: cancelToken*/
      );

      success!(response.data);
    } on DioError catch (e) {
      error(createErrorEntity(e));
    }
  }

  List<Interceptor> logInterceptor() {
    //RUNNING APPLICATION MODE DEBUG, RELEASE ETC.
    if (kReleaseMode) {
      return [];
    } else {
      return [LogInterceptor(requestBody: true, responseBody: true)];
    }
  }

  Map<String, dynamic> getAuthorizationHeader() {
    return {};
  }

  void cancelRequests(CancelToken token) {
    token.cancel('cancelled');
  }
}
