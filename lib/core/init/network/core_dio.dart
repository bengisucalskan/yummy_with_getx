import 'dart:async';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/product/widget/get_dialogs.dart';

import '../../base/model/IResponseModel.dart';
import '../../base/model/base_error.dart';
import '../../base/model/base_model.dart';
import '../../constants/enums/http_request_enum.dart';
import '../../extension/network_exntension.dart';
import 'ICoreDio.dart';
import 'no_network.dart';

part './network_core/core_operations.dart';

class CoreDio with DioMixin implements Dio, ICoreDioNullSafety {
  CoreDio(this.options) {
    options = options;
    interceptors.add(InterceptorsWrapper(
      onError: (e, handler) {
        Get.showSnackbar(GetSnackBar(
          duration: const Duration(seconds: 10),
          messageText: Text(
            e.message,
            style: Get.context?.textTheme.bodyMedium,
          ),
          backgroundColor: Colors.red,
        ));
        handler.next(e);
      },
    ));

    httpClientAdapter = DefaultHttpClientAdapter();
  }
  @override
  final BaseOptions options;

  @override
  Future<IResponseModel<T>> send<T>(
    String path, {
    required HttpTypes type,
    required BaseModel<T> parseModel,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // executes after build
        Get.dialog(GetDialog.circulerDialog());
      });
      final response = await request<dynamic>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          method: type.rawValue,
        ),
      );
      switch (response.statusCode) {
        case HttpStatus.ok:
        case HttpStatus.accepted:
          final model = _responseParser<T>(parseModel, response.data);
          Get.back();
          return ResponseModel<T>(data: model);
        default:
          Get.back();

          return ResponseModel(error: BaseError(message: response.data['Message'].toString()));
      }
    } on DioError catch (e) {
      Get.back();
      return handleNetworkError(path,
          parseModel: parseModel, type: type, e: e, isErrorDialog: true);
    }
  }
}
