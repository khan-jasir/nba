class ModuleConfig {

  static bool isStandAlone = true;

  
  static void configure({
    bool? isStandAlone,
  }) {
    if (isStandAlone != null) {
      ModuleConfig.isStandAlone = isStandAlone;
    }
  }

}