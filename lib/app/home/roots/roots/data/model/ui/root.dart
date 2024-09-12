import 'package:mysam_app/app/contributions/data/model/ui/contribution.dart';
import 'package:mysam_app/app/home/roots/roots/data/model/ui/root_status.dart';

class Root {
  final int id;
  final String documentId;
  final String value;
  final RootStatus status;
  final List<Contribution>? contributions;

  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;

  int get contributionsCount => contributions?.length ?? 0;

  Root({
    required this.id,
    required this.documentId,
    required this.value,
    required this.status,
    this.contributions,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });
}
