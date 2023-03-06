import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:lucky_investor/app/modules/home/constants/home_constants.dart';
import 'package:lucky_investor/app/modules/home/models/stock_model.dart';
import 'package:lucky_investor/app/modules/home/services/home_service.dart';
import 'package:lucky_investor/app/modules/home/exceptions/home_exceptions.dart';

class HomeServiceImpl implements HomeService {
  @override
  Future<StockModel> getStockData(String stockCode) async {
    final jsonList = await _loadAndDecode();

    for (var jsonItem in jsonList) {
      if (jsonItem['code'] == stockCode) {
        try {
          return StockModel.fromMap(jsonItem);
        } catch (_) {
          throw FailToConvertJsonException(
              'Parece que o arquivo que recebemos esta com algum problema. Tente outro código ou aguarde alguns minutos.');
        }
      }
    }
    throw FailToLocateStockException(
        'Não foi possível localizar nenhum ativo a partir dos dados digitados. Tente mudar a pesquisa!');
  }

  Future<List<Map<String, dynamic>>> _loadAndDecode() async {
    try {
      final String json = await rootBundle.loadString(HomeConstants.mockData);
      final jsonList = List<Map<String, dynamic>>.from(jsonDecode(json));
      return jsonList;
    } catch (_) {
      throw FailToLoadMockJsonException(
          'Houve uma falha no carregamento dos dados, por favor, tente novamente mais tarde.');
    }
  }
}
