part of '../imports/create_contribution_imports.dart';

class CreateContributionView extends GetView<CreateContributionController> {
  const CreateContributionView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: controller.contributionType.displayName,
      leading: AppBarLeadingType.back,
      floatingActionButton: Obx(() {
        final isNextOrFinishButtonEnabled =
            controller.isNextOrFinishButtonEnabled;
        final isLastStep = controller.isLastStep;
        return CustomIconButton(
          onPressed: isNextOrFinishButtonEnabled
              ? controller.handleNextOrFinish
              : null,
          child: Icon(
            isLastStep ? Icons.check : Icons.navigate_next,
            color: context.colors.onPrimary,
          ),
        );
      }),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
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
              child: AnimatedSwitcher(
                duration: 300.milliseconds,
                child: controller.currentStepIndex.value == 0
                    ? BuildContributionMainForm(
                        controller: controller,
                      )
                    : BuildContributionMainForm(controller: controller),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
