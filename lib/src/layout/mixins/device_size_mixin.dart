import 'package:flutter/material.dart';
import 'package:flutter_utils/src/layout/helpers/device_size.dart';

/// A mixin for categorizing device sizes.
///
/// The `DeviceSizeMixin` mixin provides boolean flags that indicate the size category 
/// of the device. This mixin helps in easily determining if the device is a small, medium, 
/// large, or extra large mobile device.
///
/// ### Properties:
/// - `isSmallMobile`: A boolean flag indicating if the device is a small mobile device.
/// - `isMediumMobile`: A boolean flag indicating if the device is a medium mobile device.
/// - `isLargeMobile`: A boolean flag indicating if the device is a large mobile device.
/// - `isExtraMobile`: A boolean flag indicating if the device is an extra large mobile device.
///
/// ### Methods:
/// - `setDeviceSizeMixinData(BuildContext context)`: should be called with the current `BuildContext` to initialize the size flags.
mixin DeviceSizeMixin {
  bool isSmallMobile = false;
  bool isMediumMobile = false;
  bool isLargeMobile = false;
  bool isExtraMobile = false;

  /// - `setDeviceSizeMixinData(BuildContext context)`: Sets the boolean flags based on the device size.
  ///   This method should be called with the current `BuildContext` to initialize the size flags.
  void setDeviceSizeMixinData(BuildContext context) {
    isSmallMobile = DeviceSize.isSmallMobile(context);
    isMediumMobile = DeviceSize.isMediumMobile(context);
    isLargeMobile = DeviceSize.isLargeMobile(context);
    isExtraMobile = DeviceSize.isExtraMobile(context);
  }
}
