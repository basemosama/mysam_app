part of '../../../../../../../imports/create_contribution_imports.dart';

class BuildContributionPhotoPickerWidget
    extends GetView<CreatePhotoContributionController> {
  const BuildContributionPhotoPickerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BuildContributionFieldWidget(
      label: AppTrans.photoContributionLabel,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.0.r),
        child: ImagePickerWidget(
          image: controller.photoFile.value,
          imageUrl: controller.photoUrl.value,
          onImagePicked: (file) {
            controller.photoFile.value = file;
          },
          onImageUrlPicked: (url) {
            controller.photoUrl.value = url;
          },
        ),
      ),
    );
  }
}
