import 'package:get/get.dart';
import 'package:lazba/src/_route/routes.dart';
import 'package:lazba/src/servers/repository.dart';

class ChangePasswordController extends GetxController {
  var isVisibleA = true.obs;
  var isVisibleB = true.obs;
  var isVisibleC = true.obs;
  var isLoading = false.obs;

  isVisibleUpdateA() {
    isVisibleA.value = !isVisibleA.value;
  }

  isVisibleUpdateB() {
    isVisibleB.value = !isVisibleB.value;
  }

  isVisibleUpdateC() {
    isVisibleC.value = !isVisibleC.value;
  }

  Future changePassword(
      {String? currentPass, String? newPass, String? confirmPass}) async {
    isLoading.value = true;
    await Repository()
        .postChangePassword(
            currentPass: currentPass,
            newPass: newPass,
            confirmPass: confirmPass)
        .then((value) {
      if (value) {
        Get.offNamed(Routes.dashboardScreen);
        isLoading.value = false;
      } else {
        isLoading.value = false;
      }
    });
  }
}
