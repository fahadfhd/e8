import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e8/utils/exceptions.dart';
import 'package:e8/utils/sp_keys.dart' as sp_keys;

mixin WebAPIMixin {
  Future getTokenFromSharedPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(sp_keys.keyToken);
    return token;
  }

  void onDioError(DioError error, String apiName) {
    String msg;
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.other:
        msg = "Please check your network connectivity";

        break;
      case DioErrorType.response:
        msg = '';
        if (error.response!.data == null) {
          throw APIException(
              enumAPIExceptions: EnumAPIExceptions.httpStatusError,
              message: msg,
              asToast: error.response!.statusCode == 400);
        }
        validateResStatusData(error.response!);

        // if (error.response!.data is Map) {
        //   final Map data = error.response!.data;
        //   if (data.containsKey("msg")) {
        //     if (data["msg"].toString().contains("Unauthenticated")) {
        //       throw APIException(
        //           enumAPIExceptions: EnumAPIExceptions.invaliedToken,
        //           message: 'Token expired',
        //           asToast: error.response!.statusCode == 404);
        //     }
        //     throw APIException(
        //         enumAPIExceptions: EnumAPIExceptions.dataSuccessFalse,
        //         message: data["msg"],
        //         asToast: error.response!.statusCode == 404);
        //   }
        // }
        break;
      case DioErrorType.cancel:
        msg = 'The request has been cancelled';
        break;
    }

    throw APIException(
        enumAPIExceptions: EnumAPIExceptions.httpStatusError,
        message: "$apiName:${error.message}",
        asToast: true);
  }

  Future<Map> validateResStatusData(Response<dynamic> response) async {
    if (response.data == null) {
      throw APIException(
          enumAPIExceptions: EnumAPIExceptions.apiResultEmpty,
          message: "the response is empty from server");
    }
    if (response.data is! Map) {
      throw APIException(
          enumAPIExceptions: EnumAPIExceptions.invaliedResultType,
          message: "Invalied result type from API response");
    }
    final Map data = response.data;

    if (data.containsKey("status")) {
      if (data['status'].toString() == '0') {
        String msg = "API response error from server";
        if (data.containsKey("msg") && (data["msg"].toString().isNotEmpty)) {
          msg = data["msg"];
        }
        throw APIException(
            enumAPIExceptions: EnumAPIExceptions.dataSuccessFalse,
            message: msg,
            asToast: true);
      }

      if (data["status"].toString() == '2') {
        String msg = "Validation Error";
        if (data.containsKey("msg") && (data["msg"].toString().isNotEmpty)) {
          msg = data["msg"];
        }
        throw APIException(
            enumAPIExceptions: EnumAPIExceptions.dataSuccessFalse,
            message: msg);
      }
    }
    return data;
  }

  Future<T> getDataPartFromRes<T>(dynamic data) async {
    if (data == null) {
      throw APIException(
          enumAPIExceptions: EnumAPIExceptions.invaliedResultType,
          message: "The API returns invalid data response hi hre");
    }

    if (data is! Map) {
      throw APIException(
          enumAPIExceptions: EnumAPIExceptions.invaliedResultType,
          message: "The API returns invalid data response hi");
    }

    // if (!data.containsKey("data")) {
    //   throw APIException(
    //       enumAPIExceptions: EnumAPIExceptions.invaliedResultType,
    //       message: "The API returns invalid data response huy");
    // }

    if (data is! T) {
      throw APIException(
          enumAPIExceptions: EnumAPIExceptions.invaliedResultType,
          message: "The API returns invalid data response yuf");
    }

    return data as T;
  }
}
