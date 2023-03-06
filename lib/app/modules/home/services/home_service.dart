import 'package:lucky_investor/app/modules/home/models/stock_model.dart';

abstract class HomeService {
  Future<StockModel> getStockData(String stockCode);
}
