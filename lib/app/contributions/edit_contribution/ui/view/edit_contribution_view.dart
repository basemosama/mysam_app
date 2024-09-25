part of '../imports/edit_contribution_imports.dart';

class EditContributionView extends GetView<EditContributionController> {
  const EditContributionView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop, _) async {
        controller.handleBack();
      },
      child: CustomScaffold(
        title: controller.contribution.type.displayName,
        leadingWidget: IconButton(
          onPressed: controller.handleBack,
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        floatingActionButton: Obx(() {
          if (controller.isReceivedContributionStep.value) {
            return const SizedBox.shrink();
          }
          final isNextOrFinishButtonEnabled =
              controller.isNextOrFinishButtonEnabled;
          final isLastStep = controller.isLastStep;

          return CustomIconButton(
            onPressed: isNextOrFinishButtonEnabled
                ? controller.handleNextOrFinish
                : null,
            child: Icon(
              isLastStep ? Icons.check : Icons.navigate_next,
              color: context.colors.surface,
            ),
          );
        }),
        child: Obx(() {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: !controller.isReceivedContributionStep.value
                ? Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.r,
                      vertical: 8.r,
                    ),
                    child: Column(
                      children: [
                        Obx(() {
                          return BuildStepperWidget(
                            stepCount: controller.currentStepCount,
                            currentStepIndex: controller.currentStepIndex.value,
                          );
                        }),
                        SizedBox(height: 8.r),
                        Expanded(
                          child: BuildContributionByTypeForum(
                            controller: controller,
                          ),
                        ),
                      ],
                    ),
                  )
                : BuildContributionReceivedContributionStep(
                    controller: controller,
                  ),
          );
        }),
      ),
    );
  }
}
