import '../resource/enum.dart';
import 'common/dio_helper.dart';

class ApiProvider {
  final DioHelper _dioHelper;

  ApiProvider(this._dioHelper);

  //GET API CALLING
  void getApi(String baseUrl,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
        dynamic data,
      required HttpSuccessCallback success,
      required HttpFailureCallback error}) {
    _dioHelper.request(baseUrl,
        data: data,
        queryParameters: queryParameters,
        headers: headers,
        success: success,
        error: error);
  }

  //POST API CALLING
  void postApi(String baseUrl,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      dynamic data,
      required HttpSuccessCallback success,
      required HttpFailureCallback error}) {
    _dioHelper.request(baseUrl,
        data: data,
        headers: headers,
        queryParameters: queryParameters,
        apiTypeEnum: ApiTypeEnum.post,
        success: success,
        error: error);
  }

  //POST API CALLING
  void putApi(String baseUrl,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      dynamic data,
      required HttpSuccessCallback success,
      required HttpFailureCallback error}) {
    _dioHelper.request(baseUrl,
        data: data,
        headers: headers,
        queryParameters: queryParameters,
        apiTypeEnum: ApiTypeEnum.put,
        success: success,
        error: error);
  }
}
