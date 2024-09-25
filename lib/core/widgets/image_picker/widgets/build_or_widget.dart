part of '../imports/image_picker_imports.dart';

class BuildOrWidget extends StatelessWidget {
  const BuildOrWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            color: context.colors.onSurface.withOpacity(.7),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.r),
          child: CustomText(
            AppTrans.orLabel,
            color: context.colors.onSurface.withOpacity(.7),
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Divider(
            color: context.colors.onSurface.withOpacity(.7),
          ),
        ),
      ],
    );
  }
}
