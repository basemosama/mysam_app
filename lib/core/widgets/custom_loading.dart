import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mysam_app/core/resources/colors/app_colors.dart';
import 'package:mysam_app/core/resources/dimens/dimens.dart';
import 'package:playx/playx.dart';

class CustomLoading extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final double? height;
  final double? size;
  const CustomLoading({
    this.margin = const EdgeInsets.only(bottom: Dimens.bottomNavBarHeight),
    this.height,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    // return CenterLoading.adaptive(
    //   color: context.colors.primary,
    // );
    return Center(
      child: Container(
        height: height ?? context.height * .2,
        margin: margin,
        child: SpinKitPouringHourGlassRefined(
          color: context.colors.primary,
          size: size ?? context.height * .1,
        ),
        // child: Lottie.asset(Assets.animations.loading),
      ),
    );
  }
}
