part of '../../../../../../../imports/create_contribution_imports.dart';

class BuildContributionModernMeaningWordsWidget
    extends GetView<CreateModernMeaningContributionController> {
  const BuildContributionModernMeaningWordsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BuildContributionFieldWidget(
      label: AppTrans.modernMeaningContributionLabel,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: controller.wordsController,
                  hint: AppTrans.modernMeaningContributionHint,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                  scrollPadding: EdgeInsets.symmetric(vertical: 80.r),
                  onSubmitted: (_) {
                    controller.addWord();
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.addWord();
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
              children: controller.words
                  .map(
                    (e) => Chip(
                      label: CustomText(e),
                      onDeleted: () {
                        controller.words.remove(e);
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
