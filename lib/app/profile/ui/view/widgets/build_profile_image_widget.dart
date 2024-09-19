part of '../../imports/profile_imports.dart';

class BuildProfileImageWidget extends StatelessWidget {
  final UserInfo user;
  const BuildProfileImageWidget({
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      width: 140.r,
      height: 140.r,
      margin: EdgeInsets.only(top: 16.r, bottom: 16.r),
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: user.image?.url ?? '',
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => PlaceholderImageWidget(
            path: Assets.images.profilePlaceholder,
          ),
          placeholder: (context, url) => PlaceholderImageWidget(
            path: Assets.images.profilePlaceholder,
          ),
        ),
      ),
    );
  }
}
