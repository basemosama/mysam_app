part of '../../../imports/edit_contribution_imports.dart';

class BuildContributionMainFormRelatedWordTypeWidget extends StatelessWidget {
  final EditContributionController controller;

  const BuildContributionMainFormRelatedWordTypeWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BuildContributionFieldWidget(
      label: AppTrans.keywordTypeLabel,
      child: Obx(() {
        return FilterChipSelector(
          items: ContributionRelatedWordType.values,
          itemLabel: (type) => type?.displayName ?? '',
          selectedItem: controller.relatedWordType.value,
          onSelectedItemChanged: (ContributionRelatedWordType? item) {
            controller.relatedWordType.value = item;
          },
        );
      }),
    );
  }
}
