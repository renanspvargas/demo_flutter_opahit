import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      home: Container(),
    );
  }
}
