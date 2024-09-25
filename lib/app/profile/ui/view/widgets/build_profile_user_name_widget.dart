part of '../../imports/profile_imports.dart';

class BuildProfileUserNameWidget extends StatelessWidget {
  final UserInfo user;
  const BuildProfileUserNameWidget({
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8.0.r,
      ),
      child: CustomText(
        user.getFullName(fallbackAsEmail: false) ?? '-',
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
