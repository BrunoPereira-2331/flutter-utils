import 'dart:io';

final class Device {
  static String getSystemCurrentLocaleName() {
    return Platform.localeName;
  }

  static String getDartRuntimeVersion() {
    return Platform.version;
  }

  static String getOperatingSystem() {
    return Platform.operatingSystem;
  }

  static String getOperatingSystemVersion() {
    return Platform.operatingSystemVersion;
  }

  static String getSystemLocale() {
    String systemLocale = Device.getSystemCurrentLocaleName().substring(0, 2);
    if (systemLocale.isEmpty) {
      systemLocale = "en";
    }
    return systemLocale;
  }
  static String getSystemLocaleCountry() {
    String systemCountry = Device.getSystemCurrentLocaleName().substring(3, 5).toLowerCase();
    if (systemCountry.isEmpty) {
      systemCountry = "us";
    }
    return systemCountry;
  }
}
