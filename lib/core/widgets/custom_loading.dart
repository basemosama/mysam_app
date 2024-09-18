import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mysam_app/core/resources/colors/app_colors.dart';
import 'package:mysam_app/core/resources/dimens/dimens.dart';
import 'package:playx/playx.dart';

class CustomLoading extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  const CustomLoading({
    this.margin = const EdgeInsets.only(bottom: Dimens.bottomNavBarHeight),
  });

  @override
  Widget build(BuildContext context) {
    // return CenterLoading.adaptive(
    //   color: context.colors.primary,
    // );
    return Center(
      child: Container(
        height: context.height * .2,
        margin: margin,
        child: SpinKitPouringHourGlassRefined(
          color: AppColors.primaryKey,
          size: context.height * .1,
        ),
        // child: Lottie.asset(Assets.animations.loading),
      ),
    );
  }
}
