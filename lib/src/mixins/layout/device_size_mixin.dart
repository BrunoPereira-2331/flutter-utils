import 'package:flutter/material.dart';

import '../../layout/device_size.dart';

mixin DeviceSizeMixin {

  bool isSmallMobile = false;
  bool isMediumMobile = false;
  bool isLargeMobile = false;
  bool isExtraMobile = false;

  void setDeviceSizeMixinData(BuildContext context) {
    isSmallMobile = DeviceSize.isSmallMobile(context);
    isMediumMobile = DeviceSize.isMediumMobile(context);
    isLargeMobile = DeviceSize.isLargeMobile(context);
    isExtraMobile = DeviceSize.isExtraMobile(context);
  }

}