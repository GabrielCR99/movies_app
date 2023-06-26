import 'dart:developer';

import 'package:get/get.dart';

import '../../core/mixins/loader_mixin.dart';
import '../../core/mixins/message_mixin.dart';
import '../../services/login/login_service.dart';

final class LoginController extends GetxController
    with LoaderMixin, MessageMixin {
  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  final LoginService _service;

  LoginController({required LoginService service}) : _service = service;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  Future<void> login() async {
    _loading.toggle();
    try {
      await _service.login();
      _loading.toggle();
    } catch (e) {
      _loading.toggle();
      log('Erro ao realizar login', error: e);
      _message(
        const MessageModel.error(
          title: 'Login error',
          message: 'Erro ao relizar login',
        ),
      );
    }
  }
}
