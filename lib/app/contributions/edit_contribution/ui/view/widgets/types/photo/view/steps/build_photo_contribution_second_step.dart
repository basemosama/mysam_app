part of '../../../../../../imports/edit_contribution_imports.dart';

class BuildPhotoContributionSecondStep
    extends GetView<EditPhotoContributionController> {
  const BuildPhotoContributionSecondStep({super.key});

  @override
  Widget build(BuildContext context) {
    return OptimizedScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BuildContributionMainFormRootWidget(controller: controller),
          const BuildContributionPhotoPickerWidget(),
          SizedBox(height: 64.r),
        ],
      ),
    );
  }
}
