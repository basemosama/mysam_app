part of '../imports/contributions_imports.dart';

class ContributionsView extends GetView<ContributionsController> {
  const ContributionsView({super.key});
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
        child: Center(
      child: CustomText('Contributions'),
    ));
  }
}
