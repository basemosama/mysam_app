import 'package:flutter/material.dart';
import 'package:mysam_app/core/resources/assets/assets.dart';
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
        height: context.height * .15,
        margin: margin,
        child: Lottie.asset(Assets.animations.loading),
      ),
    );
  }
}
