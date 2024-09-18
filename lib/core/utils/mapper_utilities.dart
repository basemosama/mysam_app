import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:playx/playx.dart';

typedef Mapper<T, S> = FutureOr<S> Function(T data);

Future<S> _mapAsync<T, S>(List arguments) async {
  final data = arguments[0] as T;
  final mapper = arguments[1] as Mapper<T, S>;
  return await mapper(data);
}

class MapUtils {
  MapUtils._();

  static Future<S> mapAsync<T, S>(T data, Mapper<T, S> mapper) async {
    return await mapper(data);
  }

  static Future<S> mapAsyncInIsolate<T, S>(T data, Mapper<T, S> mapper) async {
    final res = await compute(_mapAsync<T, S>, [data, mapper]);

    return res;
  }
}

extension MapAsync<T> on T {
  Future<S> mapAsync<S>(Mapper<T, S> mapper) async {
    return await MapUtils.mapAsync(this, mapper);
  }

  Future<S> mapAsyncInIsolate<S>(Mapper<T, S> mapper) async {
    return await MapUtils.mapAsyncInIsolate(this, mapper);
  }
}

extension MapAsyncList<T> on List<T> {
  Future<List<S>> mapAsync<S>(Mapper<T, S> mapper) async {
    return await Future.wait(map((e) => e.mapAsync(mapper)));
  }

  Future<List<S>> mapAsyncInIsolate<S>(Mapper<T, S> mapper) async {
    return await Future.wait(map((e) => e.mapAsyncInIsolate(mapper)));
  }
}

extension NetworkResultMapExt<T> on NetworkResult<T> {
  Future<NetworkResult<S>> mapDataAsync<S>({
    required Mapper<T, NetworkResult<S>> mapper,
  }) async {
    switch (this) {
      case NetworkSuccess():
        return await mapper((this as NetworkSuccess<T>).data);
      case NetworkError():
        final error = (this as NetworkError<T>).error;
        return NetworkError<S>(error);
    }
  }

  Future<NetworkResult<S>> mapDataAsyncInIsolate<S>({
    required Mapper<T, NetworkResult<S>> mapper,
  }) async {
    return await MapUtils.mapAsyncInIsolate(this, (NetworkResult<T> res) async {
      switch (res) {
        case NetworkSuccess():
          try {
            return await mapper(res.data);
          } catch (e) {
            rethrow;
          }
        case NetworkError():
          return NetworkError<S>(res.error);
      }
    });
  }

  Future<S> mapAsyncInIsolate2<S>({
    required Mapper<NetworkSuccess<T>, S> success,
    required Mapper<NetworkError<T>, S> error,
  }) async {
    return await MapUtils.mapAsyncInIsolate(this, (NetworkResult<T> res) async {
      switch (res) {
        case NetworkSuccess():
          return await success(res);
        case NetworkError():
          return await error(res);
      }
    });
  }

  Future<S> mapAsyncInIsolate<S>({
    required Mapper<T, S> success,
    required Mapper<NetworkException, S> error,
  }) async {
    return await MapUtils.mapAsyncInIsolate(this, (NetworkResult<T> res) async {
      switch (res) {
        case NetworkSuccess():
          return await success(res.data);
        case NetworkError():
          return await error(res.error);
      }
    });
  }

  Future<S> mapAsync2<S>({
    required Mapper<NetworkSuccess<T>, S> success,
    required Mapper<NetworkError<T>, S> error,
  }) async {
    return await MapUtils.mapAsync(this, (NetworkResult<T> res) async {
      switch (res) {
        case NetworkSuccess():
          return await success(res);
        case NetworkError():
          return await error(res);
      }
    });
  }
}
