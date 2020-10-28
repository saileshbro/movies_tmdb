import 'package:flutter/cupertino.dart';
import 'package:movies_tmdb/presentation/app_localizations.dart';

extension StringExtension on String {
  String intelliTrim() {
    if (length > 15) {
      return "${substring(0, 15)}...";
    } else {
      return this;
    }
  }

  String t(BuildContext context) =>
      AppLocalizations.of(context).translate(this);
}
