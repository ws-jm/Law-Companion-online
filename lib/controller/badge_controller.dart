import 'package:get/get.dart';
import 'package:ftv2/resource/extensions.dart';
import '../../resource/server_string.dart';
import '../../shared/api_repository.dart';
import '../../shared/common/state_status.dart';
import '../../shared/get_storage_repository.dart';
import '../model/badge_entity.dart';
import '../resource/session_string.dart';

class BadgeController extends GetxController {
  final ApiRepository _apiRepository;
  final GetStorageRepository _getStorageRepository;

  BadgeController(this._apiRepository, this._getStorageRepository);

  final _stateStatusRx = Rx<StateStatus>(StateStatus.INITIAL);
  StateStatus get stateStatus => _stateStatusRx.value;

  final _dataRx = Rx<List<News>>([]);
  List<News> get data => _dataRx.value;
  RxString deviceId = ''.obs;

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
    _apiRepository.postApi(ServerString.badgesUrl, headers: headers, data: {
      'device_id': deviceId.value,
    }, success: (response) {
      BadgeEntity newsEntity = BadgeEntity.fromRawJson(response);
      if (newsEntity.status == 'success') {
        _dataRx.value = BadgeEntity.fromRawJson(response).news!;
        _stateStatusRx.value = StateStatus.SUCCESS;
      }
    }, error: (error) {
      _stateStatusRx.value = StateStatus.SUCCESS;
      showErrorSnackbar(error!.message);
    });
  }
}
