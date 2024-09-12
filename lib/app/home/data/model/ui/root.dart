import 'package:mysam_app/app/home/data/model/ui/root_status.dart';

class Root {
  final int id;
  final String documentId;
  final String value;
  final RootStatus status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;

  Root({
    required this.id,
    required this.documentId,
    required this.value,
    required this.status,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });
}
