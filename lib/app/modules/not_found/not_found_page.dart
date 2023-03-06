import 'package:get/get.dart';
import 'package:lucky_investor/app/modules/not_found/pages/not_found_page.dart';

class NotFoundRoutes {
  NotFoundRoutes._();

  static final router = GetPage(
    name: pageNotFound,
    page: () => const NotFoundPage(),
  );

  static const pageNotFound = '/pageNotFound';
}
