import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'shared/api_provider.dart';
import 'shared/api_repository.dart';
import 'shared/common/dio_helper.dart';
import 'shared/get_storage_repository.dart';

class DependencyInjection {
  static void init() {
    Get.lazyPut<GetStorage>(() => GetStorage(), fenix: true);
    Get.lazyPut<GetStorageRepository>(() => GetStorageRepository(Get.find()),
        fenix: true);

    //DIO BINDIN
    Get.lazyPut<DioHelper>(() => DioHelper(Dio()), fenix: true);
    Get.lazyPut<ApiProvider>(() => ApiProvider(Get.find()), fenix: true);
    Get.lazyPut<ApiRepository>(() => ApiRepository(Get.find()), fenix: true);
  }
}

