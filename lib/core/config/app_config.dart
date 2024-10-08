import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mysam_app/core/network/api_client.dart';
import 'package:mysam_app/core/preferences/env_manger.dart';
import 'package:mysam_app/core/preferences/preference_manger.dart';
import 'package:mysam_app/core/utils/app_utils.dart';
import 'package:mysam_app/core/widgets/navigation/bottom_nav/bottom_navigation/ui/imports/bottom_navigation_imports.dart';
import 'package:mysam_app/core/widgets/navigation/navigation_drawer/ui/imports/custom_navigation_drawer_imports.dart';
import 'package:playx/playx.dart';

/// This class contains app configuration like playx configuration.
class AppConfig extends PlayXAppConfig {
  // setup and boot your dependencies here
  @override
  Future<void> boot() async {
    //USED FOR DEBUGGING
    WidgetsFlutterBinding.ensureInitialized();
    if (kDebugMode) {
      Fimber.plantTree(DebugTree(useColors: true));
    }
    Get.put<MyPreferenceManger>(MyPreferenceManger());
    Get.put<EnvManger>(EnvManger());
    final PlayxNetworkClient client = await ApiClient.createApiClient();
    Get.put<PlayxNetworkClient>(client);

    AppUtils.setupTimeAgoMessages();
    // final database = await AppDatabase.create();
    //
    // if (kDebugMode) {
    //   database.runTestWebApp();
    // }
    //
    Get.put<CustomNavigationDrawerController>(
      CustomNavigationDrawerController(),
    );
    Get.put<CustomBottomNavigationController>(
      CustomBottomNavigationController(),
    );
  }

  @override
  Future<void> asyncBoot() async {}
}
