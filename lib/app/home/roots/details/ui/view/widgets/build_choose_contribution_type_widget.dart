part of '../../imports/root_details_imports.dart';

class BuildChooseContributionTypeWidget extends StatelessWidget {
  final Function(ContributionType)? onTypeSelected;
  const BuildChooseContributionTypeWidget({super.key, this.onTypeSelected});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 4.r, vertical: 8.r),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          List.generate(ContributionType.availableTypes.length, (i) {
            final type = ContributionType.availableTypes[i];
            return CustomElevatedButton(
              label: type.displayName,
              onPressed: () {
                onTypeSelected?.call(type);
              },
              margin: EdgeInsets.symmetric(horizontal: 16.r, vertical: 6.r),
              padding: EdgeInsets.symmetric(vertical: 20.r, horizontal: 8.r),
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            );
          }),
        ),
      ),
    );
  }

  static SliverWoltModalSheetPage buildPage(
      {required BuildContext context,
      Function(ContributionType)? onTypeSelected}) {
    return CustomModal.buildCustomModalPage(
      title: AppTrans.chooseContributionType,
      body: BuildChooseContributionTypeWidget(onTypeSelected: onTypeSelected),
      context: context,
      onClosePressed: () {
        PlayxNavigation.pop();
      },
    );
  }
}
