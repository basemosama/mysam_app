import 'package:mysam_app/core/models/page_info.dart';

class DataWrapper<T> {
  final T data;
  final PageInfo? pagination;

  DataWrapper({
    required this.data,
    this.pagination,
  });

  bool get isLastPage =>
      pagination == null ||
      (pagination!.page >= pagination!.pageCount) ||
      pagination!.pageCount == 0 ||
      (data is List && (data as List).isEmpty);
}
