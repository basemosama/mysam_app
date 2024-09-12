part of '../imports/root_details_imports.dart';

class RootDetailsView extends GetView<RootDetailsController> {
  const RootDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: controller.root.value,
      leading: AppBarLeadingType.back,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.contributeToRoot(context: context);
        },
        child: Icon(
          Icons.edit_outlined,
          color: context.colors.onPrimary,
        ),
      ),
      child: controller.root.contributionsCount == 0
          ? const BuildEmptyRouteContributionsWidget()
          : const BuildEmptyRouteContributionsWidget(),
    );
  }
}
