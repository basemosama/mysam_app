import 'package:flutter/cupertino.dart';
import 'package:mysam_app/app/contributions/data/model/ui/contribution.dart';
import 'package:mysam_app/core/resources/translation/app_translations.dart';
import 'package:mysam_app/core/widgets/bottom_sheet/custom_modal.dart';
import 'package:mysam_app/core/widgets/components/custom_elevated_button.dart';
import 'package:playx/playx.dart';

class BuildChooseContributionTypeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 4.r, vertical: 8.r),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          List.generate(
            Contribution.availableContributions.length,
            (e) => CustomElevatedButton(
              label: Contribution.availableContributions[e],
              onPressed: () {},
              margin: EdgeInsets.symmetric(horizontal: 16.r, vertical: 6.r),
              padding: EdgeInsets.symmetric(vertical: 20.r, horizontal: 8.r),
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  static SliverWoltModalSheetPage buildPage(BuildContext context) {
    return CustomModal.buildCustomModalPage(
      title: AppTrans.chooseContributionType,
      body: BuildChooseContributionTypeWidget(),
      context: context,
      onClosePressed: () {
        PlayxNavigation.pop();
      },
    );
  }
}
