import 'package:get/get.dart';
import 'package:lazba/src/data/local_data_helper.dart';
import 'package:lazba/src/models/order_list_model.dart';
import 'package:lazba/src/servers/repository.dart';

class OrderHistoryController extends GetxController {
  var isLoading = true.obs;
  OrderListModel orderListModel = OrderListModel();

  Future getOrderList() async {
    orderListModel = await Repository().getOrderList();
    isLoading.value = false;
  }

  Future getGuestOrderList({String? trxId}) async {
    orderListModel = await Repository().getGuestOrderList(trxId: trxId!);
    isLoading.value = false;
  }

  @override
  void onInit() {
    if (LocalDataHelper().getUserToken() != null) {
      getOrderList();
    } else {
      getGuestOrderList(trxId: LocalDataHelper().getCartTrxId());
    }
    super.onInit();
  }
}
