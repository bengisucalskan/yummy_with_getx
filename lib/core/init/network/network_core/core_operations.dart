part of '../core_dio.dart';

extension _CoreDioOperations on CoreDio {
  T? _responseParser<T>(BaseModel<T> model, dynamic data) {
    if (data is List) {
      return data
          .map((e) => model.fromJson(e as Map<String, dynamic>))
          .toList()
          .cast<T>() as T;
    } else if (data is Map) {
      return model.fromJson(data as Map<String, dynamic>);
    }
    return data as T?;
  }
}

extension NetworkEror on CoreDio {
  Future<IResponseModel<T>> handleNetworkError<T>(
    String path, {
    required BaseModel<T> parseModel,
    required HttpTypes type,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    bool isErrorDialog = false,
    required DioError e,
  }) async {
    bool isRetry = false;
    await NoNetworkManager(
            onRetry: () {
              isRetry = true;
            },
            isEnable: true)
        .show();

    if (isRetry) {
      return await send(
        path,
        type: type,
        data: data,
        parseModel: parseModel,
        queryParameters: queryParameters,
      );
    }

    return ResponseModel(
        error: BaseError(
            message: e.response != null
                ? e.response!.data['Message'].toString()
                : e.error.toString(),
            type: e.type));
  }
}
