import 'package:flutter/material.dart';

/// The `MediaQuerySizeHelper` class should be used when you need to access
/// only the size-related properties from `MediaQuery`. This class provides
/// a streamlined approach that helps to improve performance by limiting
/// the scope to size properties only.
/// By using `MediaQuerySizeHelper`, you ensure that your widget is more
/// efficient in terms of performance, as it avoids unnecessary processing
/// of other `MediaQuery` data that is not related to size.
class MediaQuerySizeHelper {

  final BuildContext context;
  late MediaQueryData _mediaQuery;

  MediaQuerySizeHelper(this.context) {
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