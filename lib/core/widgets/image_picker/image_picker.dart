part of 'imports/image_picker_imports.dart';

class ImagePickerWidget extends StatefulWidget {
  final void Function(File file)? onImagePicked;
  final void Function(String imageUrl)? onImageUrlPicked;
  final File? image;
  final String? imageUrl;

  const ImagePickerWidget({
    super.key,
    this.onImagePicked,
    this.onImageUrlPicked,
    this.image,
    this.imageUrl,
  });

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? imageFile;
  String? imageUrl;

  @override
  void initState() {
    imageFile = widget.image;
    imageUrl = widget.imageUrl;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 8.r),
      alignment: Alignment.center,
      child: DottedBorder(
        color: context.colors.onSurface.withOpacity(.7),
        borderType: BorderType.RRect,
        radius: Radius.circular(16.r),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          clipBehavior: Clip.hardEdge,
          elevation: 0,
          child: imageFile != null || imageUrl != null
              ? BuildImagePreview(
                  file: imageFile,
                  url: imageUrl,
                  onDelete: () {
                    setState(() {
                      imageFile = null;
                      imageUrl = null;
                    });
                  },
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BuildPickImageFromGalleryWidget(
                      onImagePicked: (image) {
                        widget.onImagePicked?.call(image);
                        setState(() {
                          imageFile = image;
                        });
                      },
                    ),
                    SizedBox(height: 8.r),
                    const BuildOrWidget(),
                    SizedBox(height: 8.r),
                    BuildCaptureImageWidget(
                      onImagePicked: (image) {
                        widget.onImagePicked?.call(image);
                        setState(() {
                          imageFile = image;
                        });
                      },
                    ),
                    const BuildOrWidget(),
                    SizedBox(height: 8.r),
                    BuildPickImageFromUrlWidget(
                      onImageUrlPicked: (url) {
                        widget.onImageUrlPicked?.call(url);
                        Fimber.d(
                            'BuildImagePreview ImagePickerWidget: url: $url');
                        setState(() {
                          imageUrl = url;
                        });
                      },
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ImagePickerWidget oldWidget) {
    if (oldWidget.image?.path != widget.image?.path) {
      setState(() {
        imageFile = widget.image;
      });
    }
    super.didUpdateWidget(oldWidget);
  }
}
