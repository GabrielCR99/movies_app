import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin MessageMixin on GetxController {
  void messageListener(Rxn<MessageModel> message) {
    ever<MessageModel?>(
      message,
      (model) {
        if (model != null) {
          Get.snackbar(
            model.title,
            model.message,
            backgroundColor: model.type.color,
          );
        }
      },
    );
  }
}

class MessageModel {
  final String title;
  final String message;
  final MessageType type;

  const MessageModel({
    required this.title,
    required this.message,
    required this.type,
  });

  const MessageModel.error({
    required this.title,
    required this.message,
  }) : type = MessageType.error;

  const MessageModel.info({
    required this.title,
    required this.message,
  }) : type = MessageType.info;
}

enum MessageType { error, info }

extension MessageTypeExtension on MessageType {
  Color get color {
    switch (this) {
      case MessageType.error:
        return Colors.red[800] ?? Colors.red;
      case MessageType.info:
        return Colors.blue[600] ?? Colors.blue;
    }
  }
}
