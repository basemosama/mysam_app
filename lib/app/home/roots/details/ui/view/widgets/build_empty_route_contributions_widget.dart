part of '../../imports/root_details_imports.dart';

class BuildEmptyRouteContributionsWidget extends StatelessWidget {
  const BuildEmptyRouteContributionsWidget();

  @override
  Widget build(BuildContext context) {
    return OptimizedScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: context.height * .35,
            padding: EdgeInsets.symmetric(horizontal: 8.0.r),
            child: ImageViewer.svgAsset(Assets.images.rootContributions),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 28.0.r, horizontal: 8.0.r),
            child: const CustomText(
              AppTrans.noRootContributionsYet,
              style: CustomTextStyle.titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
