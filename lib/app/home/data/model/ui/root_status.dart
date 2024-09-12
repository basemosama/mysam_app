enum RootStatus {
  raw,
  hasConfirmedContribution,
  hasNonConfirmedContribution;

  static RootStatus fromString(String status) {
    switch (status) {
      case 'raw':
        return RootStatus.raw;
      case 'has-confirmed-contribution':
        return RootStatus.hasConfirmedContribution;
      case 'has-non-confirmed-contribution':
        return RootStatus.hasNonConfirmedContribution;
      default:
        throw Exception('Unknown status: $status');
    }
  }

  String toShortString() {
    switch (this) {
      case RootStatus.raw:
        return 'raw';
      case RootStatus.hasConfirmedContribution:
        return 'has-confirmed-contribution';
      case RootStatus.hasNonConfirmedContribution:
        return 'has-non-confirmed-contribution';
    }
  }
}
