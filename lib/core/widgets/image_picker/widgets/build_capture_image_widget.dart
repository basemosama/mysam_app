part of '../imports/image_picker_imports.dart';

class BuildCaptureImageWidget extends StatelessWidget {
  final Function(File image)? onImagePicked;
  const BuildCaptureImageWidget({
    this.onImagePicked,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: () async {
        _captureImage();
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 16.0.r,
          vertical: 8.r,
        ),
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
                Icons.add_a_photo,
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
                AppTrans.captureImageLabel,
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

  Future<void> _captureImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      final File file = File(image.path);
      onImagePicked?.call(file);
    }
  }
}
