part of '../../imports/create_contribution_imports.dart';

class BuildStepperWidget extends StatelessWidget {
  final int stepCount;
  final int currentStepIndex;

  const BuildStepperWidget({
    super.key,
    required this.stepCount,
    required this.currentStepIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.r, horizontal: 8.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int i = 0; i < stepCount; i++) ...[
            AnimatedContainer(
              width: 36.r,
              height: 36.r,
              duration: 300.milliseconds,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentStepIndex >= i
                    ? context.colors.filledColor
                    : context.colors.surface,
                border: Border.all(
                  color: context.colors.filledColor,
                  width: 1.r,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 10.r,
                    height: 10.r,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.colors.onSurface,
                    ),
                  ),
                ],
              ),
            ),
            if (i < stepCount - 1)
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.0.r,
                  ),
                  child: AnimatedContainer(
                    duration: 300.milliseconds,
                    child: BuildStepLineWidget(
                      height: 8.r,
                      strokeWidth: 3.r,
                      lineColor: context.colors.onSurface,
                      dashColor: currentStepIndex > i
                          ? context.colors.onSurface
                          : context.colors.filledColor,
                      activeColor: context.colors.onSurface,
                      isActive: currentStepIndex > i,
                      dashSpace: 9.r,
                    ),
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }
}
