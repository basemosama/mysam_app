part of '../../imports/contributions_imports.dart';

class BuildContributionStatusChip extends StatelessWidget {
  final Contribution contribution;
  final double? width;

  const BuildContributionStatusChip({
    required this.contribution,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FeatureChip(
      label: contribution.status.displayName,
      backgroundColor: contribution.status.backgroundColor(context),
      color: contribution.status.onBackgroundColor(context),
      width: width,
    );
  }
}
