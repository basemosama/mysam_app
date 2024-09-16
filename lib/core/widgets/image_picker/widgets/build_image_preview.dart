part of '../imports/image_picker_imports.dart';

class BuildImagePreview extends StatelessWidget {
  final File? file;
  final String? url;
  final VoidCallback? onDelete;
  const BuildImagePreview({this.file, this.url, this.onDelete});

  @override
  Widget build(BuildContext context) {
    Fimber.d('BuildImagePreview: file: $file, url: $url');
    return SizedBox(
      height: context.height * .3,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (file != null) ...[
            ImageViewer.file(file!),
          ] else if (url != null) ...[
            ImageViewer.cachedNetwork(
              url!,
              // errorBuilder: (ctx, e) => Column(
              //   mainAxisSize: MainAxisSize.min,
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Icon(
              //       Icons.error,
              //       color: Colors.redAccent,
              //       size: 40.r,
              //     ),
              //     SizedBox(height: 16.r),
              //     CustomText(
              //       AppTrans.imagePickerFromUrlError,
              //       color: Colors.redAccent,
              //       fontSize: 14.sp,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ],
              // ),
            ),
          ],
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(
                Icons.delete_forever,
                color: Colors.redAccent,
              ),
              onPressed: () {
                onDelete?.call();
              },
            ),
          ),
        ],
      ),
    );
  }
}
