import 'package:flutter/material.dart';

Size displaySize(BuildContext context) {
  debugPrint('Size = ${MediaQuery.of(context).size}');
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  debugPrint('Height = ${displaySize(context).height}');
  return displaySize(context).height;
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double displayWidth(BuildContext context) {
  debugPrint('Width = ${displaySize(context).width}');
  return displaySize(context).width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getScreenHeightExcludeSafeArea(BuildContext context) {
  final double height = MediaQuery.of(context).size.height;
  final EdgeInsets padding = MediaQuery.of(context).padding;
  return height - padding.top - padding.bottom;
}

double getScreenWidthtExcludeSafeArea(BuildContext context) {
  final double width = MediaQuery.of(context).size.width;
  final EdgeInsets padding = MediaQuery.of(context).padding;
  return width - padding.top - padding.bottom;
}
