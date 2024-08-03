import 'package:flutter/material.dart';
import 'package:flutter_utils/src/layout/helpers/media_query_size_helper.dart';

/// A mixin that stores current device size.
///
/// The `LayoutMixin` mixin provides device size properties.
/// This mixin helps to access device size avaliable width, height, etc.
///
/// ### Properties:
/// - `deviceAvaliableWidth`: a double variable that returns the current device avaliable width.
/// - `deviceAvaliableHeight`: a double variable that returns the current device avaliable height.
///
/// ### Methods:
/// - `setLayoutMixinData(BuildContext context)`: should be called in the build method with the current `BuildContext` to initialize the size variables
/// and also to update everytime the widget rebuilds.
mixin LayoutMixin {

  double deviceAvaliableHeight = 0.00;
  double deviceAvaliableWidth = 0.00;

  void setLayoutMixinData(BuildContext context) {
    MediaQuerySizeHelper device = MediaQuerySizeHelper(context);
    deviceAvaliableWidth = device.width();
    deviceAvaliableHeight = device.height();
  }

}