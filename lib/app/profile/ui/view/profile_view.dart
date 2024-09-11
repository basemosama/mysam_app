part of '../imports/profile_imports.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
        child: Center(
      child: CustomText('Profile'),
    ));
  }
}
