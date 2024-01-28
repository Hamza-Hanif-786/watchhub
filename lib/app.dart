import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchhub/bindings/general_bindings.dart';
import 'package:watchhub/routes/app_routes.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: WatchHubTheme.lightTheme,
      darkTheme: WatchHubTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      // Show Loader or Circular Progress Indicator meanwhile Authentication Repository is deciding to show relevant screen.
      home: const Scaffold(
        backgroundColor: WatchHubColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      )
    );
  }
}