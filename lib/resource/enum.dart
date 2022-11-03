enum LoadingStatusEnum { initial, loading, success }
enum ApiTypeEnum { get, post, delete, put }
bool isNumeric(String s) => s.isNotEmpty && double.tryParse(s) != null;
