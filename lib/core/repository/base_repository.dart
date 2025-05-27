import 'package:nba_sdk/core/config/sdk_config.dart';
import 'package:nba_sdk/core/di/service_locator.dart';
import 'package:nba_sdk/core/network/api_client.dart';

abstract class BaseRepository {
  ApiClient get client => ServiceLocator.get<ApiClient>();
  SdkConfig get config => ServiceLocator.get<SdkConfig>();
}