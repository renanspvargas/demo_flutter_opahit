import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucky_investor/app/core/bindings/application_bindings.dart';
import 'package:lucky_investor/app/modules/home/routes/home_routes.dart';
import 'package:lucky_investor/app/modules/not_found/not_found_page.dart';

void main() {
  runApp(const LuckyInvestorApp());
}

class LuckyInvestorApp extends StatelessWidget {
  const LuckyInvestorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Lucky Investor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: ApplicationBinding(),
      initialRoute: HomeRoutes.home,
      getPages: [
        ...HomeRoutes.routers,
      ],
      unknownRoute: NotFoundRoutes.router,
    );
  }
}
