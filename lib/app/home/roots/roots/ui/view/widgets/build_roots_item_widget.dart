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
            label: root.status.name,
            backgroundColor: [
              Colors.green,
              Colors.orange,
              Colors.red,
            ][root.status.index],
            color: Colors.white,
            icon: Icons.edit,
          ),
        ],
      ),
    );
  }
}
