part of '../imports/register_imports.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OptimizedScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 4.r,
                        horizontal: 4.r,
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Align(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: 16.0.r,
                                  ),
                                  child: const BuildRegisterLottieAnimation(),
                                ),
                              ),
                              const BuildRegisterBackButton(),
                            ],
                          ),
                          Obx(() {
                            return AnimatedSwitcher(
                              duration: const Duration(milliseconds: 500),
                              transitionBuilder: (
                                Widget child,
                                Animation<double> animation,
                              ) {
                                return SlideTransition(
                                  position: Tween<Offset>(
                                    begin: const Offset(1, 0),
                                    end: Offset.zero,
                                  ).animate(animation),
                                  child: child,
                                );
                              },
                              child: controller.currentLoginMethod.value ==
                                      LoginMethod.email
                                  ? const BuildRegisterWithEmailWidget()
                                  : const BuildChooseRegisterMethodWidget(),
                            );
                          }),
                          const BuildRegisterHaveAccountWidget(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 4.r),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: AppVersion(
                      textStyle: TextStyle(
                        color: context.colors.onSurface,
                        fontSize: 12.sp,
                        fontFamily: fontFamily,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.r),
                ],
              ),
              const BuildRegisterLoadingOverlay(),
            ],
          ),
        ),
      ),
    );
  }
}
