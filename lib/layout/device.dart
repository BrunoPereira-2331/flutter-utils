import 'package:flutter/material.dart';

class Device {

  final BuildContext context;
  late MediaQueryData _mediaQuery;

  Device(this.context) {
    _mediaQuery = MediaQuery.of(context);
  }

  Size sizeProperties() => _mediaQuery.size;

  double width() {
    return sizeProperties().width; 
  }
  double height() {
    return sizeProperties().height; 
  }

}