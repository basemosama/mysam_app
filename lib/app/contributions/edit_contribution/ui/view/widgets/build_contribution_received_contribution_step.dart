part of '../../imports/edit_contribution_imports.dart';

class BuildContributionReceivedContributionStep extends StatelessWidget {
  final EditContributionController controller;

  const BuildContributionReceivedContributionStep({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return OptimizedScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageViewer.svgAsset(
            Assets.images.contributionSuccess,
            height: context.height * .35,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 28.0.r, horizontal: 8.0.r),
            child: CustomText(
              AppTrans.contributionReceived,
              style: CustomTextStyle.titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
