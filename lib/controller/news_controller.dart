import 'package:ftv2/model/news_entity.dart';
import 'package:ftv2/resource/extensions.dart';
import 'package:get/get.dart';
import '../../resource/server_string.dart';
import '../../shared/api_repository.dart';
import '../../shared/common/state_status.dart';
import '../../shared/get_storage_repository.dart';

class NewsController extends GetxController {
  final ApiRepository _apiRepository;
  final GetStorageRepository _getStorageRepository;

  NewsController(this._apiRepository, this._getStorageRepository);

  final _stateStatusRx = Rx<StateStatus>(StateStatus.INITIAL);
  StateStatus get stateStatus => _stateStatusRx.value;

  final _dataRx = Rx<List<News>>([]);
  List<News> get data => _dataRx.value;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getData();
  }

  var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
  getData() async {
    _stateStatusRx.value = StateStatus.LOADING;
    _apiRepository.postApi(ServerString.newsUrl, headers: headers,
        success: (response) {
      NewsEntity newsEntity = NewsEntity.fromRawJson(response);
      if (newsEntity.status == 'success') {
        _dataRx.value = NewsEntity.fromRawJson(response).news!;
        _stateStatusRx.value = StateStatus.SUCCESS;
      }
    }, error: (error) {
      _stateStatusRx.value = StateStatus.SUCCESS;
      showErrorSnackbar(error!.message);
    });
  }
}
