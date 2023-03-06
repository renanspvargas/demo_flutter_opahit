import 'package:get/get.dart';
import 'package:lucky_investor/app/modules/home/home_bindings.dart';
import 'package:lucky_investor/app/modules/home/home_page.dart';

class HomeRoutes {
  HomeRoutes._();

  static final routers = <GetPage>[
    GetPage(
      name: home,
      binding: HomeBindings(),
      page: () => const HomePage(),
    ),
  ];

  static const home = '/home';
}
