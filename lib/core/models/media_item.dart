import 'dart:io';

import 'package:playx/playx.dart';

class MediaItem {
  final int? id;
  final String? url;
  final String? name;
  final String? type;
  final double? width;
  final double? height;
  final double? size;
  final File? file;

  MediaItem({
    this.id,
    this.url,
    this.name,
    this.type,
    this.size,
    this.width,
    this.height,
    this.file,
  });

  factory MediaItem.fromJson(dynamic json) {
    final map = json as Map<String, dynamic>;
    return MediaItem(
      id: asIntOrNull(map, 'id'),
      url: asStringOrNull(map, 'url'),
      name: asStringOrNull(map, 'name'),
      type: asStringOrNull(map, 'type'),
      size: asDoubleOrNull(map, 'size'),
      width: asDoubleOrNull(map, 'width'),
      height: asDoubleOrNull(map, 'height'),
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['url'] = url;
    map['name'] = name;
    map['type'] = type;
    map['size'] = size;
    map['width'] = width;
    map['height'] = height;
    return map;
  }

  Future<FormData?> toFormData() async {
    if (url != null && url!.isNotEmpty) {
      // Fimber.d('URL: $url');

      try {
        final res = await Dio().get(
          url!,
          options: Options(
            responseType: ResponseType.bytes,
          ),
        );
        final image = MultipartFile.fromBytes(
          res.data as List<int>,
          filename: name ?? url!.split('/').last,
        );
        return FormData.fromMap({
          'files': image,
        });
      } catch (e) {
        return null;
      }
    }

    if (file != null) {
      final image = await MultipartFile.fromFile(
        file!.path,
      );
      return FormData.fromMap({
        'files': image,
      });
    }
    return null;
  }

  @override
  String toString() {
    return 'MediaItem(id: $id, url: $url, name: $name, type: $type, width: $width, height: $height, size: $size, file: $file)';
  }
}
