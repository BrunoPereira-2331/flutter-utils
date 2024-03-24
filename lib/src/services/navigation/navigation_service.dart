import 'package:flutter/material.dart';

class NavigationService {

  static pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

}