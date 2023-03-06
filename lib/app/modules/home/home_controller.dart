import 'dart:developer';

import 'package:get/get.dart';
import 'package:lucky_investor/app/core/mixins/loader_mixin.dart';
import 'package:lucky_investor/app/core/mixins/messages_mixin.dart';
import 'package:lucky_investor/app/modules/home/models/stock_model.dart';
import 'package:lucky_investor/app/modules/home/services/home_service.dart';
import 'package:lucky_investor/app/modules/home/exceptions/home_exceptions.dart';

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

  Future<void> getStockData({String stockCode = 'PETR4'}) async {
    try {
      _loading.toggle();
      final result = await _homeService.getStockData(stockCode.toUpperCase());
      await Future.delayed(const Duration(seconds: 2));
      stockData(result);
      _loading.toggle();
    } on FailToLoadMockJsonException catch (e, s) {
      _loading.toggle();
      log('Falha ao carregar JSON', error: e, stackTrace: s);
      _message(MessageModel(
        title: 'Erro',
        message: e.message,
      ));
    } on FailToLocateStockException catch (e, s) {
      _loading.toggle();
      log('Pesquisa nao corresponde a nenhum stock listado',
          error: e, stackTrace: s);
      _message(MessageModel(
        title: 'Erro',
        message: e.message,
      ));
    } on FailToConvertJsonException catch (e, s) {
      _loading.toggle();
      log('Erro na conversao dos dados para model', error: e, stackTrace: s);
      _message(MessageModel(
        title: 'Erro',
        message: e.message,
      ));
    }
  }
}
