import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            'assets/images/bg.png',
            width: context.width,
            height: context.height,
            fit: BoxFit.cover,
          ),
          const ColoredBox(color: Colors.black45),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              children: [
                Image.asset('assets/images/logo.png'),
                const SizedBox(height: 50),
                SizedBox(
                  width: context.width * 0.9,
                  height: 42,
                  child: SignInButton(
                    Buttons.Google,
                    onPressed: controller.login,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    text: 'Entrar com o Google',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
