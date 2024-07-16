import 'package:get/instance_manager.dart';
import 'package:lazba/src/controllers/news_controller.dart';

class NewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewsController());
  }
}
