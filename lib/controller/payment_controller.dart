import 'package:ftv2/resource/session_string.dart';
import 'package:ftv2/shared/api_repository.dart';
import 'package:ftv2/shared/get_storage_repository.dart';
import 'package:get/get.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';
class PaymentController extends GetxController {

  final ApiRepository _apiRepository;
  final GetStorageRepository _getStorageRepository;

  PaymentController(this._apiRepository, this._getStorageRepository);


  launchWhatsApp() async {
    final link = WhatsAppUnilink(
      phoneNumber: '+2348131210744',
      text: " I would like to extend my subscription, my email is: ${_getStorageRepository.read(SessionString.emailSession)}",
    );
    await launch('$link');
  }
}