part of '../imports/splash_imports.dart';

//splash screen.
class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: _BuildSplashLogoWidget()),
            // BuildSplashAppTitleWidget(),
            Obx(() {
              return AnimatedVisibility(
                isVisible: controller.isLoading.value,
                child: CustomLoading(
                  margin: EdgeInsets.zero,
                  height: context.height * .15,
                  size: context.height * .075,
                ),
              );
            }),
            const BuildSplashAppVersionWidget(),
          ],
        ),
      ),
    );
  }
}
