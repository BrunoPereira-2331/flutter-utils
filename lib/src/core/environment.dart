import 'package:flutter_utils/src/core/device.dart';

enum EnvironmentType {prod, dev, test}

class Environment {
  static String _domain = "";
  static String _appVersion = "1.0.0";
  static EnvironmentType _type = EnvironmentType.dev;

  static final Environment _environment = Environment._internal();

  // An internal private constructor to access it for only once for static instance of class.

  // Factry constructor to retutn same static instance everytime you create any object.
  factory Environment() {
    return _environment;
  }

  Environment._internal();

  static get domain => _domain;

  static setDomain(String domain) {
    _domain = domain;
  }

  static String getAppVersion() {
    return _appVersion;
  }

  static setAppVersion(String appVersion) {
    if (_appVersion != "1.0.0") {
      return;
    }
    _appVersion = appVersion;
  }

  /// Returns EnvironmentType (PROD, DEV or TEST)
  static EnvironmentType getType() {
    return _type;
  }

  /// Set Environment Type (PROD, DEV or TEST)
  static setType(String type) {
    EnvironmentType environmentType = EnvironmentType.dev;
    switch (type) {
      case "prod":
        environmentType = EnvironmentType.prod;
        break;
      case "test":
        environmentType = EnvironmentType.test;
        break;
    }
    _type = environmentType;
  }

  /// Returns full URL with HTTPS
  static String get domainUrl => "https://${domain}.com.br";

  static  bool get isDevMode => getType() == EnvironmentType.dev;
  static  bool get isProdMode => getType() == EnvironmentType.prod;

  static Map<String, dynamic> getAppDetails() {
    return {
      "app_version": Environment.getAppVersion(),
      "dart_runtime": Device.getDartRuntimeVersion(),
      "operating_system": Device.getOperatingSystem(),
      "operating_system_version": Device.getOperatingSystemVersion(),
      "language": Device.getSystemCurrentLocaleName()
    };
  }
}
