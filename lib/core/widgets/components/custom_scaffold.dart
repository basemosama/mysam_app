import 'package:flutter/material.dart';
import 'package:mysam_app/core/resources/colors/app_colors.dart';
import 'package:mysam_app/core/resources/translation/app_translations.dart';
import 'package:mysam_app/core/widgets/custom_app_bar.dart';
import 'package:playx/playx.dart';

class CustomScaffold extends StatelessWidget {
  final Widget child;
  final String? title;
  final EdgeInsetsGeometry? padding;
  final PlatformAppBar? appBar;
  final Widget? floatingActionButton;
  final AppBarLeadingType leading;
  final Widget? leadingWidget;
  final bool useSafeArea;
  final bool includeThemeSwitchingArea;

  const CustomScaffold({
    required this.child,
    this.title,
    this.padding,
    this.appBar,
    this.floatingActionButton,
    this.leading = AppBarLeadingType.none,
    this.leadingWidget,
    this.useSafeArea = true,
    this.includeThemeSwitchingArea = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final scaffoldChild = Container(
      padding: padding,
      alignment: Alignment.center,
      child: GetPlatform.isIOS
          ? Scaffold(
              floatingActionButton: floatingActionButton,
              body: child,
            )
          : child,
    );

    final scaffold = PlatformScaffold(
      appBar: appBar ??
          buildAppBar(
            title: title ?? AppTrans.appName,
            context: context,
            leading: leading,
            leadingWidget: leadingWidget,
          ),
      body: useSafeArea ? SafeArea(child: scaffoldChild) : scaffoldChild,
      material: (context, platform) => MaterialScaffoldData(
        floatingActionButton: floatingActionButton,
      ),
      backgroundColor: context.colors.surface,
    );

    return includeThemeSwitchingArea
        ? PlayxThemeSwitchingArea(
            child: scaffold,
          )
        : scaffold;
  }
}
