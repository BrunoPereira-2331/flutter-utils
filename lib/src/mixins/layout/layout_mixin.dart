import 'package:flutter/material.dart';

import '../../layout/device.dart';

mixin LayoutMixin {

  double deviceAvaliableHeight = 0.00;
  double deviceAvaliableWidth = 0.00;

  void setLayoutMixinData(BuildContext context) {
    Device device = Device(context);
    deviceAvaliableWidth = device.width();
    deviceAvaliableHeight = device.height();
  }

}