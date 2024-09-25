part of '../imports/profile_imports.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: AppTrans.profile,
      child: RxDataStateWidget(
        rxData: controller.userDataState,
        onSuccess: (user) => OptimizedScrollView(
          child: Column(
            children: [
              BuildProfileImageWidget(
                user: user,
              ),
              BuildProfileUserNameWidget(
                user: user,
              ),
              BuildProfileUserEmailWidget(
                user: user,
              ),
              const Expanded(child: BuildProfileFieldsWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
