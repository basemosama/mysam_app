part of '../../imports/login_imports.dart';

class BuildLoginLoadingOverlay extends GetView<LoginController> {
  const BuildLoginLoadingOverlay();

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
