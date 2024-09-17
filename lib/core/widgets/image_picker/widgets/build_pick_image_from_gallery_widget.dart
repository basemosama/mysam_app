part of '../imports/image_picker_imports.dart';

class BuildPickImageFromGalleryWidget extends StatelessWidget {
  final Function(File image)? onImagePicked;
  const BuildPickImageFromGalleryWidget({
    this.onImagePicked,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: () async {
        _pickImage();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0.r,
          vertical: 8.r,
        ),
        width: double.infinity,
        // height: context.height * .2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0.r,
                vertical: 8.r,
              ),
              child: Icon(
                Icons.image_rounded,
                color: context.colors.onSurface.withOpacity(.7),
                size: 40.r,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0.r,
                vertical: 4.r,
              ),
              child: CustomText(
                AppTrans.addImageLabel,
                color: context.colors.onSurface.withOpacity(.7),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final File file = File(image.path);
      onImagePicked?.call(file);
    }
  }
}
