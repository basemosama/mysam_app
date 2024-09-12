import 'package:mysam_app/core/models/media_item.dart';
import 'package:playx/playx.dart';

class ApiProfile {
  // 3
  final int id;

  // p240ot76w668cmmvy9hf1hja
  final String documentId;

  // test22
  final String username;

  // test22@gmail.com
  final String email;

  final String? firstName;
  final String? lastName;
  final MediaItem? image;

  // local
  final String? provider;

  // true
  final bool? confirmed;

  // false
  final bool? blocked;

  // 2024-07-22T23:39:47.749Z
  final String? createdAt;

  // 2024-08-29T11:32:10.449Z
  final String? updatedAt;

  // false
  final bool newUser;

  ApiProfile({
    required this.id,
    required this.documentId,
    required this.username,
    required this.email,
    this.firstName,
    this.lastName,
    this.image,
    this.provider,
    this.confirmed,
    this.blocked,
    this.createdAt,
    this.updatedAt,
    required this.newUser,
  });

  factory ApiProfile.fromJson(dynamic json) => ApiProfile(
        id: asInt(json as Map<String, dynamic>, 'id'),
        documentId: asString(json, 'documentId'),
        username: asString(json, 'username'),
        email: asString(json, 'email'),
        firstName: asStringOrNull(json, 'firstName'),
        lastName: asStringOrNull(json, 'lastName'),
        image: json['image'] == null
            ? null
            : MediaItem.fromJson(asMap(json, 'image')),
        provider: asStringOrNull(json, 'provider'),
        confirmed: asBoolOrNull(json, 'confirmed'),
        blocked: asBoolOrNull(json, 'blocked'),
        createdAt: asStringOrNull(json, 'createdAt'),
        updatedAt: asStringOrNull(json, 'updatedAt'),
        newUser: asBool(json, 'newUser'),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'documentId': documentId,
        'username': username,
        'firstName': firstName,
        'lastName': lastName,
        'image': image?.toJson(),
        'email': email,
        'provider': provider,
        'confirmed': confirmed,
        'blocked': blocked,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'newUser': newUser,
      };
}
