import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin LoaderMixin on GetxController {
  void loaderListener(RxBool loadingRx) => ever(
        loadingRx,
        (loading) => loading
            ? Get.dialog(
                WillPopScope(
                  onWillPop: () async => false,
                  child:
                      const Center(child: CircularProgressIndicator.adaptive()),
                ),
                barrierDismissible: false,
              )
            : Get.back(),
      );
}
