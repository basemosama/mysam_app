part of '../imports/image_picker_imports.dart';

class BuildPickImageFromUrlWidget extends StatelessWidget {
  final Function(String)? onImageUrlPicked;

  const BuildPickImageFromUrlWidget({
    this.onImageUrlPicked,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: () async {
        _pickImageUrl(context: context);
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
              child: CustomText.icon(
                AppTrans.addImageFromUrlLabel,
                icon: IconInfo(
                  icon: Icons.link,
                ),
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

  void _pickImageUrl({required BuildContext context}) {
    final TextEditingController urlController = TextEditingController();

    CustomModal.showPageModal(
      context: context,
      onModalDismissedWithBarrierTap: () {
        PlayxNavigation.pop();
      },
      pageBuilder: (context) {
        return CustomModal.buildCustomModalPage(
          title: AppTrans.addImageFromUrlLabel,
          body: SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 8.r),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextField(
                    controller: urlController,
                    hint: AppTrans.imageUrlHint,
                    type: TextInputType.url,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return AppTrans.imageUrlRequired;
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 8.r,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ValueListenableBuilder(
                        valueListenable: urlController,
                        builder: (context, value, _) {
                          return CustomElevatedButton(
                            label: AppTrans.confirm,
                            onPressed: value.text.isEmpty
                                ? null
                                : () {
                                    onImageUrlPicked?.call(value.text.trim());
                                    PlayxNavigation.pop();
                                  },
                          );
                        },
                      ),
                      TextButton(
                        onPressed: () {
                          onImageUrlPicked?.call(urlController.text.trim());
                          PlayxNavigation.pop();
                        },
                        child: CustomText(
                          AppTrans.cancel,
                          color: context.colors.onSurface,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          onClosePressed: () {
            PlayxNavigation.pop();
          },
          context: context,
        );
      },
    );
  }
}
