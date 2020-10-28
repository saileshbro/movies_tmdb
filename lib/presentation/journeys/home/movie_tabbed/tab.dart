import 'package:flutter/foundation.dart';

class Tab {
  final int index;
  final String title;

  const Tab({
    @required this.index,
    @required this.title,
  })  : assert(index >= 0, "Index cannot be negative!"),
        assert(title != null, "Title cannot be empty!");
}
