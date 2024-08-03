import 'package:flutter/material.dart';

import '../enums/device_size_type.dart';
import 'media_query_size_helper.dart';

/// The `DeviceSize` class provides methods to check the type of device size
class DeviceSize {
  static const double _SMALL_MOBILE = 320;
  static const double _MEDIUM_MOBILE = 480;
  static const double _LARGE_MOBILE = 768;
  static const double _EXTRA_MOBILE = 1024;

  static double smallMobileBP() => _SMALL_MOBILE;
  static double mediumMobileBP() => _MEDIUM_MOBILE;
  static double largeMobileBP() => _LARGE_MOBILE;
  static double extraMobileBP() => _EXTRA_MOBILE;

  static DeviceSizeType deviceSizeType(BuildContext context) {
    if (isSmallMobile(context)) {
      return DeviceSizeType.small;
    }
    if (isMediumMobile(context)) {
      return DeviceSizeType.medium;
    }
    if (isLargeMobile(context)) {
      return DeviceSizeType.large;
    }
    return DeviceSizeType.extra;
  }

  static bool isSmallMobile(BuildContext context) {
    Size deviceSizeProperties = MediaQuerySizeHelper(context).sizeProperties();
    double deviceAvalibleWidth = deviceSizeProperties.width;
    return deviceAvalibleWidth <= smallMobileBP();
  }

  static bool isMediumMobile(BuildContext context) {
    Size deviceSizeProperties = MediaQuerySizeHelper(context).sizeProperties();
    double deviceAvalibleWidth = deviceSizeProperties.width;
    return deviceAvalibleWidth > smallMobileBP() && deviceAvalibleWidth <= mediumMobileBP();
  }

  static bool isLargeMobile(BuildContext context) {
    Size deviceSizeProperties = MediaQuerySizeHelper(context).sizeProperties();
    double deviceAvalibleWidth = deviceSizeProperties.width;
    return deviceAvalibleWidth > mediumMobileBP() &&
        deviceAvalibleWidth <= largeMobileBP();
  }
  static bool isExtraMobile(BuildContext context) {
    Size deviceSizeProperties = MediaQuerySizeHelper(context).sizeProperties();
    double deviceAvalibleWidth = deviceSizeProperties.width;
    return deviceAvalibleWidth > largeMobileBP();
  }
}
