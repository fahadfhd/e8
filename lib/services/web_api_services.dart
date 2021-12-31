import 'package:dio/dio.dart';
import 'package:e8/home/model/home_model.dart';
import 'package:e8/utils/urls.dart' as urls;
import '_mixin_api.dart';

class WebAPIServices with WebAPIMixin {
  static final WebAPIServices _instance = WebAPIServices._initialise();

  WebAPIServices._initialise()
      : _dio = Dio(BaseOptions(
          headers: {"accept": "application/json"},
        ))
          ..interceptors.add(LogInterceptor(
              responseHeader: true,
              responseBody: true,
              requestBody: true,
              requestHeader: true));

  factory WebAPIServices() => _instance;
  final Dio _dio;
  Dio get dio => _dio;

  Future<HomeModel> loadHomes() => dio
      .get(urls.homeURL)
      .then(super.validateResStatusData)
      .then((value) => getDataPartFromRes(value))
      .then((value) => HomeModel.fromJson(value));
}
