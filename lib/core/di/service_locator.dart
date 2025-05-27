import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nba_sdk/core/config/sdk_config.dart';
import 'package:nba_sdk/core/network/network.dart';


class ServiceLocator {
  static late GetIt _instance;

  static Future<void> init(SdkConfig config) async {
    _instance = GetIt.instance;

    _instance.registerSingleton<SdkConfig>(config);
    
    _instance.registerLazySingleton<ApiClient>(
        () => DioClient(dio: Dio(
            BaseOptions(
                baseUrl: config.apiBaseUrl,
                connectTimeout: const Duration(seconds: 5),
                receiveTimeout: const Duration(seconds: 3),
                sendTimeout: const Duration(seconds: 3),
            )
        ))
    );

  }

  static T get<T extends Object>() => _instance<T>();

}
