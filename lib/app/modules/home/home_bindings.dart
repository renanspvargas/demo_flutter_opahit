import 'package:get/get.dart';
import 'package:lucky_investor/app/modules/home/home_controller.dart';
import 'package:lucky_investor/app/modules/home/services/home_service.dart';
import 'package:lucky_investor/app/modules/home/services/home_service_impl.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeService>(
      () => HomeServiceImpl(),
    );
    Get.lazyPut(
      () => HomeController(homeService: Get.find()),
    );
  }
}
