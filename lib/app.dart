import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchhub/features/authentication/screen/onboarding/onboarding.dart';
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
      home: const OnBoardingScreen()
    );
  }
}