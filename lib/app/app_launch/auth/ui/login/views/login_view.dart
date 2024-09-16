part of '../imports/login_imports.dart';

// login screen widget.
class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OptimizedScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.r),
                child: Column(
                  children: [
                    const BuildLoginBackButton(),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 4.r,
                          horizontal: 4.r,
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            SizedBox(height: 8.r),
                            const BuildLoginLottieAnimation(),
                            SizedBox(height: 24.r),
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
                                    ? const BuildLoginWithEmailWidget()
                                    : const BuildChooseLoginMethodWidget(),
                              );
                            }),
                            SizedBox(height: 12.r),
                            const BuildLoginRegisterNowWidget(),
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
                    SizedBox(height: 8.r),
                  ],
                ),
              ),
              const BuildLoginLoadingOverlay(),
            ],
          ),
        ),
      ),
    );
  }
}
