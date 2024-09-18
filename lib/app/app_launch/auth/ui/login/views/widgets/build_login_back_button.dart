part of '../../imports/login_imports.dart';

class BuildLoginBackButton extends GetView<LoginController> {
  const BuildLoginBackButton();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedOpacity(
        opacity:
            controller.currentLoginMethod.value == LoginMethod.email ? 1 : 0,
        duration: const Duration(milliseconds: 500),

        /// Back button
        child: Container(
          width: double.infinity,
          alignment: AlignmentDirectional.centerStart,
          padding: EdgeInsets.symmetric(
            vertical: 4.r,
            horizontal: 4.r,
          ),
          child: IconButton(
            onPressed: () {
              controller.currentLoginMethod.value = null;
            },
            icon: Icon(
              Icons.adaptive.arrow_back,
              color: context.colors.primary,
            ),
          ),
        ),
      );
    });
  }
}
