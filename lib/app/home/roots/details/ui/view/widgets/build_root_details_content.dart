part of '../../imports/root_details_imports.dart';

class BuildRootDetailsContent extends StatelessWidget {
  final Root root;
  const BuildRootDetailsContent({required this.root, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: root.contributionsCount,
      padding: EdgeInsets.only(bottom: 80.r),
      itemBuilder: (context, index) {
        final contribution = root.availableContributions[index];
        return BuildRootDetailsContributionItemWidget(
          contribution: contribution,
        );
      },
    );
  }
}
