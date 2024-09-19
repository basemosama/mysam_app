part of '../../imports/profile_imports.dart';

class BuildProfileFieldWidget extends StatelessWidget {
  final String label;
  final IconInfo? leadingIcon;
  final IconInfo? trailingIcon;
  final VoidCallback? onTap;
  const BuildProfileFieldWidget({
    required this.label,
    this.leadingIcon,
    this.trailingIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 0.0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0.r, vertical: 12.0.r),
          decoration: BoxDecoration(
            color: context.colors.surface,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              if (leadingIcon != null)
                CircleAvatar(
                  backgroundColor: context.colors.filledColor.withOpacity(0.7),
                  radius: 17.r,
                  child: Icon(
                    leadingIcon!.icon,
                    color: context.colors.subtitleTextColor,
                  ),
                ),
              SizedBox(width: 8.0.r),
              Expanded(
                child: CustomText(
                  label,
                  color: context.colors.subtitleTextColor,
                  fontSize: 14.0.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (trailingIcon != null)
                Icon(
                  trailingIcon!.icon,
                  color: context.colors.onSurface,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
