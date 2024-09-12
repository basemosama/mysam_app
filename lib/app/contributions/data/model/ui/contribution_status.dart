enum ContributionStatus {
  pending,
  confirmed,
  declined;

  static ContributionStatus fromString(String status) {
    switch (status) {
      case 'pending':
        return ContributionStatus.pending;
      case 'confirmed':
        return ContributionStatus.confirmed;
      case 'declined':
        return ContributionStatus.declined;
      default:
        throw Exception('Unknown contribution status: $status');
    }
  }

  String toShortString() {
    switch (this) {
      case ContributionStatus.pending:
        return 'pending';
      case ContributionStatus.confirmed:
        return 'confirmed';
      case ContributionStatus.declined:
        return 'declined';
    }
  }
}
