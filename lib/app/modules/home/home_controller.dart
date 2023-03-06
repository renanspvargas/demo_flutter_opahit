import 'package:get/get.dart';
import 'package:lucky_investor/app/modules/home/services/home_service.dart';

class HomeController extends GetxController {
  final HomeService _homeService;

  HomeController({required HomeService homeService})
      : _homeService = homeService;
}
