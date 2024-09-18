part of '../../imports/edit_contribution_imports.dart';

class BuildContributionMainForm extends StatelessWidget {
  final EditContributionController controller;

  const BuildContributionMainForm({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return OptimizedScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BuildContributionMainFormRootWidget(controller: controller),
          BuildContributionMainFormRelatedWordWidget(controller: controller),
          BuildContributionMainFormRelatedWordWeightWidget(
            controller: controller,
          ),
          BuildContributionMainFormRelatedWordTypeWidget(
            controller: controller,
          ),
          BuildContributionMainFormRelatedWordPropertiesWidget(
            controller: controller,
          ),
          SizedBox(height: 64.r),
        ],
      ),
    );
  }
}
