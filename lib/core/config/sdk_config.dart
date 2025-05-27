class SdkConfig {

  SdkConfig({
    required this.apiBaseUrl,
    this.enableLogging = false,
  });

  final String apiBaseUrl;
  final bool enableLogging;
}