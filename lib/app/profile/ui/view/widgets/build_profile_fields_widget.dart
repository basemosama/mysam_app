part of '../../imports/profile_imports.dart';

class BuildProfileFieldsWidget extends GetView<ProfileController> {
  const BuildProfileFieldsWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        border: Border(
          top: BorderSide(
            color: context.colors.onSurface,
            width: 1.r,
          ),
        ),
      ),
      margin: EdgeInsets.symmetric(vertical: 20.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16.r),
          BuildProfileFieldWidget(
            label: AppTrans.settings,
            leadingIcon: IconInfo(
              icon: Icons.settings,
            ),
            onTap: controller.navigateToSettings,
          ),
          BuildProfileFieldWidget(
            label: AppTrans.editProfileName,
            leadingIcon: IconInfo(
              icon: CupertinoIcons.person_alt_circle,
            ),
            onTap: controller.editProfileName,
            trailingIcon: IconInfo(
              icon: Icons.edit_outlined,
            ),
          ),
          // BuildProfileFieldWidget(
          //   label: AppTrans.darkMode,
          //   leadingIcon: IconInfo(
          //     icon: CupertinoIcons.moon_stars,
          //   ),
          // ),
          SizedBox(height: 4.r),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomElevatedButton(
                  label: AppTrans.logout,
                  onPressed: controller.logout,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.r,
                    vertical: 24.r,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
