import 'package:ftv2/resource/extensions.dart';
import 'package:get/get.dart';
import '../../resource/server_string.dart';
import '../../resource/session_string.dart';
import '../../shared/api_repository.dart';
import '../../shared/common/state_status.dart';
import '../../shared/get_storage_repository.dart';
import '../model/history_entity.dart';

class SearchHistoryController extends GetxController {
  final ApiRepository _apiRepository;
  final GetStorageRepository _getStorageRepository;

  SearchHistoryController(this._apiRepository, this._getStorageRepository);

  var deviceId = ''.obs;

  final _dataRx = Rx<List<User>>([]);
  List<User> get data => _dataRx.value;

  final _stateStatusRx = Rx<StateStatus>(StateStatus.INITIAL);
  StateStatus get stateStatus => _stateStatusRx.value;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    deviceId.value = _getStorageRepository.read(SessionString.deviceIdSession);
    await getData();
  }

  var headers = {'Content-Type': 'application/x-www-form-urlencoded'};

  getData() async {
    _stateStatusRx.value = StateStatus.LOADING;
    _apiRepository.postApi(ServerString.SearchHistoryGetUrl, headers: headers, data: {
      'device_id': deviceId.value,
    },
        success: (response) {
          HistoryEntity newsEntity = HistoryEntity.fromRawJson(response);
      if (newsEntity.status == 'success') {
        _dataRx.value = HistoryEntity.fromRawJson(response).users!;
        _stateStatusRx.value = StateStatus.SUCCESS;
      }
    }, error: (error) {
      _stateStatusRx.value = StateStatus.SUCCESS;
      showErrorSnackbar(error!.message);
    });
  }
}
