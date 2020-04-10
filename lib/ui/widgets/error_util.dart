import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';



class ErrorUtil {
  static String errorToMessage(Object error, BuildContext context) {
    if (error is String) {
      return error;
    } else if (error is DioError) {
      switch (error.type) {
        case DioErrorType.CONNECT_TIMEOUT:
          return 'زمان اتصال منقضی شده است';
          break;
        case DioErrorType.SEND_TIMEOUT:
          return 'زمان اتصال منقضی شده است';
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          return 'زمان اتصال منقضی شده است';
          break;
        case DioErrorType.RESPONSE:
         return 'خطایی در سرویس دهنده رخ داده است.';
          // if (error.response.statusCode == 401) // navigate to login screen
          // {
          //   WidgetsBinding.instance.addPostFrameCallback((_) {
          //     Navigator.of(context).pushNamedAndRemoveUntil(
          //       LoginScreen.route,
          //       ModalRoute.withName(LoginScreen.route),
          //     );
          //   });
          // }
          // else {
          //   try {
          //     var apiError =
          //     ApiError.fromJson(error.response.data as Map<String, dynamic>);
          //     return apiError.message;
          //   } catch (e) {
          //     return 'خطایی در سرویس دهنده رخ داده است.';
          //   }
          // }
          break;
        case DioErrorType.CANCEL:
          return 'درخواست لغو شد.';
          break;
        case DioErrorType.DEFAULT:
          if (error.error is SocketException) {
            return 'اینترنت در دسترس نیست';
          }
          return 'خطایی غیر منتظره ای اتفاق افتاده است';
          break;
      }
    } else {
      return error.toString();
    }}
}