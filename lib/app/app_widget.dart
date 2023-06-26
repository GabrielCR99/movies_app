import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/bindings/application_bindings.dart';
import 'core/ui/movies_app_ui_config.dart';
import 'routes/app_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: MoviesAppUiConfig.title,
      theme: MoviesAppUiConfig.theme,
      getPages: AppRoutes.routes,
      enableLog: false,
      initialBinding: ApplicationBindings(),
    );
  }
}
