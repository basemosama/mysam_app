import 'package:mysam_app/app/contributions/contributions/data/model/mapper/api_contribution_to_contribution_mapper.dart';
import 'package:mysam_app/app/home/roots/roots/data/model/api/api_root.dart';
import 'package:mysam_app/app/home/roots/roots/data/model/ui/root.dart';
import 'package:mysam_app/app/home/roots/roots/data/model/ui/root_status.dart';

extension ApiRootToRootMapper on ApiRoot {
  Root toRoot() {
    return Root(
      id: id,
      documentId: documentId,
      value: value,
      status: RootStatus.fromString(rootStatus),
      contributions: contributions?.map((e) => e.toContribution()).toList(),
      createdAt: createdAt != null ? DateTime.tryParse(createdAt!) : null,
      updatedAt: updatedAt != null ? DateTime.tryParse(updatedAt!) : null,
      publishedAt: publishedAt != null ? DateTime.tryParse(publishedAt!) : null,
    );
  }
}

extension RootToApiRootMapper on Root {
  ApiRoot toApiRoot() {
    return ApiRoot(
      id: id,
      documentId: documentId,
      value: value,
      rootStatus: status.toString(),
      contributions: contributions?.map((e) => e.toApiContribution()).toList(),
      createdAt: createdAt?.toIso8601String(),
      updatedAt: updatedAt?.toIso8601String(),
      publishedAt: publishedAt?.toIso8601String(),
    );
  }
}

extension ApiRootListToRootListMapper on List<ApiRoot> {
  List<Root> toRootList() {
    return map((e) => e.toRoot()).toList();
  }
}

extension RootListToApiRootListMapper on List<Root> {
  List<ApiRoot> toApiRootList() {
    return map((e) => e.toApiRoot()).toList();
  }
}
