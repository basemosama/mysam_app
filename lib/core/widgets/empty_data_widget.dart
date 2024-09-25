import 'package:flutter/material.dart';
import 'package:mysam_app/core/resources/assets/assets.dart';
import 'package:mysam_app/core/resources/colors/app_colors.dart';
import 'package:mysam_app/core/resources/translation/app_translations.dart';
import 'package:mysam_app/core/utils/app_utils.dart';
import 'package:mysam_app/core/widgets/components/custom_elevated_button.dart';
import 'package:mysam_app/core/widgets/components/custom_text.dart';
import 'package:mysam_app/core/widgets/orientation_widget.dart';
import 'package:playx/playx.dart';

class EmptyDataWidget extends OrientationWidget {
  final VoidCallback? onRetryClicked;
  final String? error;
  final bool isScrollable;
  final Color? errorColor;

  const EmptyDataWidget({
    super.key,
    this.onRetryClicked,
    this.error,
    this.isScrollable = true,
    this.errorColor,
  });

  @override
  Widget buildLandscape(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0.r),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Lottie.asset(
                Assets.animations.noDataAnimation,
              ),
            ),
            SizedBox(
              height: 6.r,
            ),
            Expanded(
              child: OptimizedScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(4.0.r),
                      child: CustomText(
                        error ?? AppTrans.emptyResponse.tr(context: context),
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w400,
                        fontSize: AppUtils.isMobile() ? 16.sp : 20.sp,
                        color: errorColor,
                      ),
                    ),
                    if (onRetryClicked != null) ...[
                      SizedBox(
                        height: AppUtils.isMobile() ? 4.r : 15.r,
                      ),
                      CustomElevatedButton(
                        color: context.colors.primary,
                        onPressed: onRetryClicked,
                        label: AppTrans.retryText.tr(context: context),
                      ),
                    ],
                    SizedBox(
                      height: AppUtils.isMobile() ? 4.r : 15.r,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildPortrait(BuildContext context) {
    final child = Padding(
      padding: EdgeInsets.all(4.0.r),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              Assets.animations.noDataAnimation,
            ),
            SizedBox(
              height: 6.r,
            ),
            Padding(
              padding: EdgeInsets.all(4.0.r),
              child: CustomText(
                error ?? AppTrans.emptyResponse.tr(context: context),
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w400,
                fontSize: AppUtils.isMobile() ? 16.sp : 20.sp,
                color: errorColor,
              ),
            ),
            if (onRetryClicked != null) ...[
              SizedBox(
                height: AppUtils.isMobile() ? 4.r : 15.r,
              ),
              CustomElevatedButton(
                color: context.colors.primary,
                onPressed: onRetryClicked,
                label: AppTrans.retryText.tr(context: context),
              ),
            ],
            SizedBox(
              height: AppUtils.isMobile() ? 4.r : 15.r,
            ),
          ],
        ),
      ),
    );
    return isScrollable
        ? OptimizedScrollView(
            child: child,
          )
        : child;
  }
}
