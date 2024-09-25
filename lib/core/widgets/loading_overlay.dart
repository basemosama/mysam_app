import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mysam_app/core/resources/colors/app_colors.dart';
import 'package:mysam_app/core/resources/translation/app_translations.dart';
import 'package:mysam_app/core/widgets/components/custom_card.dart';
import 'package:mysam_app/core/widgets/components/custom_text.dart';
import 'package:playx/playx.dart';

class LoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final String? loadingText;

  const LoadingOverlay({super.key, required this.isLoading, this.loadingText});

  @override
  Widget build(BuildContext context) {
    if (!isLoading) return const SizedBox.shrink();
    return Container(
      color: Colors.black.withOpacity(0.7),
      height: double.infinity,
      child: Center(
        child: CustomCard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 8.0.r, vertical: 24.r),
                child: SpinKitPouringHourGlassRefined(
                  color: context.colors.primary,
                  size: context.height * .075,
                ),
              ),
              if (loadingText != null && loadingText!.isNotEmpty) ...[
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.0.r,
                    vertical: 8.r,
                  ),
                  child: CustomText(
                    loadingText ?? AppTrans.loading,
                    fontSize: 16.sp,
                    color: context.colors.onSurface,
                  ),
                ),
                SizedBox(height: 16.r),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
