import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:mysam_app/core/network/helper/api_helper.dart';
import 'package:playx/playx.dart';

typedef Mapper<T, S> = FutureOr<S> Function(T data);

Future<S> _mapAsync<T, S>(List arguments) async {
  try {
    final data = arguments[0] as T;
    final mapper = arguments[1] as Mapper<T, S>;
    return await mapper(data);
  } catch (e) {
    rethrow;
  }
}

class MapUtils {
  MapUtils._();

  static Future<S> mapAsync<T, S>(T data, Mapper<T, S> mapper) async {
    try {
      return mapper(data);
    } catch (e) {
      // Handle any errors in the main thread
      throw Exception('Error in mapAsync: $e');
    }
  }

  static Future<S> mapAsyncInIsolate<T, S>(T data, Mapper<T, S> mapper) async {
    try {
      final res = await compute(_mapAsync<T, S>, [data, mapper]);
      return res;
    } catch (e, stacktrace) {
      // Handle errors occurring in the isolate
      Fimber.e('Error in mapAsyncInIsolate: ', ex: e, stacktrace: stacktrace);
      throw Exception('Error in isolate: $e');
    }
  }
}

extension MapAsync<T> on T {
  Future<S> mapAsync<S>(Mapper<T, S> mapper) async {
    return MapUtils.mapAsync(this, mapper);
  }

  Future<S> mapAsyncInIsolate<S>(Mapper<T, S> mapper) async {
    return MapUtils.mapAsyncInIsolate(this, mapper);
  }
}

extension MapAsyncList<T> on List<T> {
  Future<List<S>> mapAsync<S>(Mapper<T, S> mapper) async {
    return Future.wait(map((e) => e.mapAsync(mapper)));
  }

  Future<List<S>> mapAsyncInIsolate<S>(Mapper<T, S> mapper) async {
    return Future.wait(map((e) => e.mapAsyncInIsolate(mapper)));
  }
}

extension NetworkResultMapExt<T> on NetworkResult<T> {
  Future<NetworkResult<S>> mapDataAsync<S>({
    required Mapper<T, NetworkResult<S>> mapper,
  }) async {
    switch (this) {
      case NetworkSuccess():
        return mapper((this as NetworkSuccess<T>).data);
      case NetworkError():
        final error = (this as NetworkError<T>).error;
        return NetworkError<S>(error);
    }
  }

  Future<NetworkResult<S>> mapDataAsyncInIsolate<S>({
    required Mapper<T, NetworkResult<S>> mapper,
  }) async {
    try {
      return MapUtils.mapAsyncInIsolate(this, (NetworkResult<T> res) async {
        switch (res) {
          case NetworkSuccess():
            return mapper(res.data);
          case NetworkError():
            return NetworkError<S>(res.error);
        }
      });
    } catch (e) {
      return ApiHelper.unableToProcessError();
    }
  }

  Future<S> mapAsyncInIsolate<S>({
    required Mapper<T, S> success,
    required Mapper<NetworkException, S> error,
  }) async {
    return MapUtils.mapAsyncInIsolate(this, (NetworkResult<T> res) async {
      switch (res) {
        case NetworkSuccess():
          return await success(res.data);
        case NetworkError():
          return await error(res.error);
      }
    });
  }
}
