part of '../../imports/register_imports.dart';

class BuildRegisterLoadingOverlay extends GetView<RegisterController> {
  const BuildRegisterLoadingOverlay();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isLoading = controller.isLoading.value;
      if (!isLoading) return const SizedBox.shrink();

      return LoadingOverlay(
        isLoading: isLoading,
        loadingText: AppTrans.loggingInText,
      );
    });
  }
}
