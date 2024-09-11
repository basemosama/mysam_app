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
                        const BuildRegisterLottieAnimation(),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // const BuildRegisterTitleWidget(),
                              const BuildRegisterSubtitleWidget(),
                              SizedBox(height: 4.r),
                              const BuildRegisterWithEmailWidget(),
                              SizedBox(height: 4.r),
                              const BuildRegisterContinueWithSocial(),
                              SizedBox(height: 4.r),
                              const BuildChooseRegisterMethodWidget(),
                            ],
                          ),
                        ),
                        const BuildRegisterHaveAccountWidget(),
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
                  )),
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
