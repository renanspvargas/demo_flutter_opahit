import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin MessagesMixin on GetxController {
  void messageListener(Rxn<MessageModel> message) {
    ever<MessageModel?>(message, (model) async {
      if (model != null) {
        Get.snackbar(
          model.title,
          model.message,
          backgroundColor: Colors.red[800]!,
          colorText: Colors.white,
          margin: const EdgeInsets.all(20),
        );
      }
    });
  }
}

class MessageModel {
  final String title;
  final String message;

  MessageModel({
    required this.title,
    required this.message,
  });
}
