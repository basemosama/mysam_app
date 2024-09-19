part of '../../../imports/profile_imports.dart';

class EditProfileNameView extends GetView<EditProfileController> {
  const EditProfileNameView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RxSliverDataStateWidget(
      rxData: controller.dataState,
      onLoading: (_) => SliverToBoxAdapter(
        child: Container(
          height: context.height * .4,
          alignment: Alignment.center,
          child: const CustomLoading(),
        ),
      ),
      onSuccess: (user) => SliverList(
        delegate: SliverChildListDelegate(
          [
            BuildEditProfileFieldWidget(
              label: AppTrans.firstNameLabel,
              child: CustomTextField(
                hint: AppTrans.firstNameHint,
                hintStyle: TextStyle(
                  color: context.colors.subtitleTextColor,
                  fontFamily: fontFamily,
                  fontSize: 13.sp,
                ),
                controller: controller.firstNameController,
                type: TextInputType.name,
                validator: qValidator([
                  IsRequired(AppTrans.firstNameRequired.tr(context: context)),
                ]),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 14.r,
                  vertical: 10.r,
                ),
                prefix: Icon(
                  Icons.person,
                  size: 18.r,
                  color: context.colors.onSurface,
                ),
                shouldAutoValidate: true,
                onValidationChanged: (isValid) {
                  controller.isFirstNameValid.value = isValid;
                },
                textInputAction: TextInputAction.next,
              ),
            ),
            BuildEditProfileFieldWidget(
              label: AppTrans.lastNameLabel,
              child: CustomTextField(
                hint: AppTrans.lastNameHint,
                controller: controller.lastNameController,
                hintStyle: TextStyle(
                  color: context.colors.subtitleTextColor,
                  fontFamily: fontFamily,
                  fontSize: 13.sp,
                ),
                type: TextInputType.name,
                validator: qValidator([
                  IsRequired(AppTrans.lastNameRequired.tr(context: context)),
                ]),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 14.r,
                  vertical: 10.r,
                ),
                prefix: Icon(
                  Icons.person,
                  size: 18.r,
                  color: context.colors.onSurface,
                ),
                shouldAutoValidate: true,
                onValidationChanged: (isValid) {
                  controller.isLastNameValid.value = isValid;
                },
              ),
            ),
            SizedBox(
              height: 16.r,
            ),
            Obx(() {
              return CustomElevatedButton(
                label: AppTrans.confirm,
                onPressed: controller.isFormValid.value
                    ? () {
                        controller.editProfileName();
                      }
                    : null,
              );
            }),
          ],
        ),
      ),
    );
  }

  static SliverWoltModalSheetPage buildPage({
    required BuildContext context,
  }) {
    return CustomModal.buildCustomModalPage(
        title: AppTrans.editProfileName,
        body: const EditProfileNameView(),
        context: context,
        onClosePressed: () {
          PlayxNavigation.pop();
        });
  }
}
