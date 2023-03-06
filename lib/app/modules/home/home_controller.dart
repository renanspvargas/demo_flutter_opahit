import 'package:get/get.dart';
import 'package:lucky_investor/app/core/mixins/loader_mixin.dart';
import 'package:lucky_investor/app/core/mixins/messages_mixin.dart';
import 'package:lucky_investor/app/modules/home/models/stock_model.dart';
import 'package:lucky_investor/app/modules/home/services/home_service.dart';

class HomeController extends GetxController with LoaderMixin, MessagesMixin {
  final HomeService _homeService;
  final _loading = false.obs;
  final _message = Rxn<MessageModel>();
  final Rxn<StockModel> stockData = Rxn();

  HomeController({required HomeService homeService})
      : _homeService = homeService;

  @override
  void onReady() async {
    super.onReady();
    await getStockData();
  }

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  Future<void> getStockData({stockCode = 'PETR4'}) async {
    final result = await _homeService.getStockData(stockCode);
    await Future.delayed(const Duration(seconds: 2));
    stockData(result);
  }
}
