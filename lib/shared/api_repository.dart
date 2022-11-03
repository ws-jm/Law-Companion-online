import 'common/dio_helper.dart';
import 'api_provider.dart';

class ApiRepository implements ApiProvider {
  final ApiProvider _apiProvider;

  ApiRepository(this._apiProvider);

  @override
  void getApi(String baseUrl,
      {Map<String, dynamic>? queryParameters,
        dynamic data,
      Map<String, dynamic>? headers,
      required HttpSuccessCallback success,
      required HttpFailureCallback error}) {


    _apiProvider.getApi(baseUrl,
        queryParameters: queryParameters,
        data: data,
        headers: headers,
        success: success,
        error: error);


  }

  @override
  void postApi(String baseUrl,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      required HttpSuccessCallback success,
      required HttpFailureCallback error}) {
    _apiProvider.postApi(baseUrl,
        queryParameters: queryParameters,
        headers: headers,
        data: data,
        success: success,
        error: error);
  }

  @override
  void putApi(String baseUrl,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      required HttpSuccessCallback success,
      required HttpFailureCallback error}) {
    _apiProvider.putApi(baseUrl,
        queryParameters: queryParameters,
        headers: headers,
        data: data,
        success: success,
        error: error);
  }
}
