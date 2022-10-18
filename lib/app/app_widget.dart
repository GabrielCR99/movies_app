import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/bindings/application_bindings.dart';
import 'routes/app_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      getPages: AppRoutes.routes,
      initialBinding: ApplicationBindings(),
    );
  }
}
