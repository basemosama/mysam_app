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
                          // const BuildLoginSubtitleWidget(),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.0.r),
                            child: const BuildLoginLottieAnimation(),
                          ),

                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                // const BuildLoginTitleWidget(),
                                const BuildLoginSubtitleWidget(),
                                SizedBox(height: 4.r),
                                const BuildLoginWithEmailWidget(),
                                SizedBox(height: 4.r),
                                const BuildLoginContinueWithSocial(),
                                SizedBox(height: 4.r),
                                const BuildChooseLoginMethodWidget(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const BuildLoginRegisterNowWidget(),
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
              const BuildLoginLoadingOverlay(),
            ],
          ),
        ),
      ),
    );
  }
}
