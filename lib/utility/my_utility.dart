import 'package:flutter/material.dart';

class MyUtility {
  static Size getSize(BuildContext context) {
    return MediaQuery.sizeOf(context);
  }

  static void showSnackBar(BuildContext context, {required String text, required Duration duration}) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(text), duration: duration));
  }

  static DisplayType getDisplayType(BuildContext context) {
    final width = getSize(context).width;
    if (width >= DisplayType.compact.min && width <= DisplayType.compact.max) {
      return DisplayType.compact;
    } else if (width >= DisplayType.medium.min &&
        width <= DisplayType.medium.max) {
      return DisplayType.medium;
    } else if (width >= DisplayType.expanded.min &&
        width <= DisplayType.expanded.max) {
      return DisplayType.expanded;
    } else if (width >= DisplayType.large.min && width <= DisplayType.large.max) {
      return DisplayType.large;
    } else {
      return DisplayType.extraLarge;
    }
  }
}

enum DisplayType {
  //smartphone (PORTRAIT), foldable (CLOSED), split screen tablet
  compact(0, 599),
  //tablet (PORTRAIT), foldable (OPEN)
  medium(600, 839),
  //phone/tablet (LANDSCAPE) o Desktop
  expanded(840, 1199),
  //Desktop
  large(1200, 1599),
  //Desktop/Ultra-wide
  extraLarge(1600, double.infinity);

  final double min;
  final double max;
  const DisplayType(this.min, this.max);
}
