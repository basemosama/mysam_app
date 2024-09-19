part of '../../imports/profile_imports.dart';

class BuildProfileUserEmailWidget extends StatelessWidget {
  final UserInfo user;

  const BuildProfileUserEmailWidget({
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.r, vertical: 4.r),
      child: CustomText(
        user.email ?? '-',
        fontSize: 16.sp,
        color: context.colors.subtitleTextColor,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
