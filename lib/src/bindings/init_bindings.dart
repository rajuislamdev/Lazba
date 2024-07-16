import 'package:get/get.dart';
import 'package:lazba/src/controllers/auth_controller.dart';
import 'package:lazba/src/controllers/currency_converter_controller.dart';
import 'package:lazba/src/controllers/home_screen_controller.dart';
import 'package:lazba/src/controllers/phone_auth_controller.dart';
import 'package:lazba/src/data/data_storage_service.dart';

class InitBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
    Get.put<PhoneAuthController>(PhoneAuthController());
    Get.put(StorageService());
    Get.lazyPut(() => CurrencyConverterController());
    Get.lazyPut(() => HomeScreenController());
  }
}
