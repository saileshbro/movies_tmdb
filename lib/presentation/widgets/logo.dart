import 'package:flutter/material.dart';
import 'package:movies_tmdb/common/extensions/extensions.dart';

class Logo extends StatelessWidget {
  final double height;

  const Logo({Key key, @required this.height})
      : assert(height != null, "Height must not be null"),
        assert(height > 0, "Height should be greater than 0"),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/pngs/logo.png",
      color: Colors.white,
      height: height.h,
    );
  }
}
