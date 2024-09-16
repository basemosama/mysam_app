part of '../../../imports/create_contribution_imports.dart';

class BuildContributionMainFormRelatedWordPropertiesWidget
    extends StatelessWidget {
  final CreateContributionController controller;

  const BuildContributionMainFormRelatedWordPropertiesWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BuildContributionFieldWidget(
      label: AppTrans.keywordPropertiesLabel,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: controller.relatedWordPropertiesController,
                  hint: AppTrans.keywordPropertiesHint,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                  scrollPadding: EdgeInsets.symmetric(vertical: 80.r),
                  onSubmitted: (_) {
                    controller.addRelatedWordProperties();
                  },
                  focus: controller.relatedWordPropertiesFocusNode,
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.addRelatedWordProperties();
                },
                icon: Icon(
                  Icons.add_circle_outline_outlined,
                  color: context.colors.primary,
                ),
              ),
            ],
          ),
          Obx(() {
            return Wrap(
              spacing: 8.r,
              runSpacing: 8.r,
              children: controller.relatedWordProperties
                  .map(
                    (e) => Chip(
                      label: CustomText(e),
                      onDeleted: () {
                        controller.relatedWordProperties.remove(e);
                      },
                    ),
                  )
                  .toList(),
            );
          }),
        ],
      ),
    );
  }
}
