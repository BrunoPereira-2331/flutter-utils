import 'package:flutter/material.dart';

import '../enums/device_size_type.dart';
import 'device_size.dart';

class ResponsiveRender {
  Widget? render(BuildContext context,
      {Function? smallLayoutCallback,
      Function? mediumLayoutCallback,
      Function? largeLayoutCallback,
      Function? extraLayoutCallback,
      Function? defaultLayoutCallback}) {
    try {
      DeviceSizeType deviceSizeType = DeviceSize.deviceSizeType(context);
      String errorMessage = "Render layout method is null - render method:";
      switch (deviceSizeType) {
        case DeviceSizeType.small:
          if (smallLayoutCallback != null) {
            return smallLayoutCallback();
          }
          throw "$errorMessage small";
        case DeviceSizeType.medium:
          if (mediumLayoutCallback != null) {
            return mediumLayoutCallback();
          }
          throw "$errorMessage medium";
        case DeviceSizeType.large:
          if (largeLayoutCallback != null) {
            return largeLayoutCallback();
          }
          throw "$errorMessage large";
        case DeviceSizeType.extra:
          if (extraLayoutCallback != null) {
            return extraLayoutCallback();
          }
          throw "$errorMessage extra";
      }
    } catch (e) {
      return Container();
    }
  }

  static double getFontSize(BuildContext context,
      {required double baseFontSize}) {
        // adicionar outros fontSizes para cada tamanho de dispositivo
    double scaleFactor = _calculateScaleFactor(context);
    
    return baseFontSize * scaleFactor;
  }

  static double _calculateScaleFactor(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double deviceWidth = mediaQuery.size.width;
    final double devicePixelRatio = mediaQuery.devicePixelRatio;
    double scaleFactor = deviceWidth * devicePixelRatio / 375;
    return scaleFactor;
  }
}
