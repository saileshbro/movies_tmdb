import 'package:flutter/material.dart';
import 'package:movies_tmdb/presentation/themes/theme_color.dart';
import 'package:wiredash/wiredash.dart';

class WiredashApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final Widget child;
  final String languageCode;
  const WiredashApp({
    Key key,
    @required this.navigatorKey,
    @required this.child,
    @required this.languageCode,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: "movieapp-0ssmfi1",
      secret: "z7jwdi673i37znnn6htk9rm8gveu14qg",
      navigatorKey: navigatorKey,
      options: WiredashOptionsData(
        locale: Locale.fromSubtags(
          languageCode: languageCode,
        ),
      ),
      theme: WiredashThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColor.royalBlue,
        secondaryColor: AppColor.violet,
        secondaryBackgroundColor: AppColor.violet,
        dividerColor: AppColor.vulcan,
      ),
      child: child,
    );
  }
}
