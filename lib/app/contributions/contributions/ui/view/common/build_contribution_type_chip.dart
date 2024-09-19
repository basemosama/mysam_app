part of '../../imports/contributions_imports.dart';

class BuildContributionTypeChip extends StatelessWidget {
  final Contribution contribution;
  final double? width;

  const BuildContributionTypeChip({
    required this.contribution,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FeatureChip(
      label: contribution.type.displayName,
      width: width,
      color: context.colors.onSurface,
    );
  }
}
