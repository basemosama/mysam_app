part of '../../imports/roots_imports.dart';

class BuildRootsItemWidget extends StatelessWidget {
  final Root root;
  const BuildRootsItemWidget({required this.root, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0.r, vertical: 4.r),
              child: CustomText(root.value, fontSize: 16.sp),
            ),
          ),
          FeatureChip(
            label: root.contributionsCount.toLocalizedArabicOrEnglishNumber(),
            backgroundColor: root.status.backgroundColor(context),
            color: root.status.onBackgroundColor(context),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  root.contributionsCount.toLocalizedArabicOrEnglishNumber(),
                  color: root.status.onBackgroundColor(context),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(width: 8.0.r),
                Icon(
                  Icons.edit_outlined,
                  color: root.status.onBackgroundColor(context),
                  size: 16.r,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
