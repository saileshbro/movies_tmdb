import 'package:flutter/material.dart';
import 'package:movies_tmdb/common/constants/size_constants.dart';
import 'package:movies_tmdb/common/extensions/extensions.dart';
import 'package:movies_tmdb/presentation/themes/theme_color.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPressed;

  const Button({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColor.royalBlue,
            AppColor.violet,
          ],
        ),
        borderRadius: BorderRadius.circular(Sizes.dimen_20.w),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.dimen_16.w,
      ),
      margin: EdgeInsets.symmetric(
        vertical: Sizes.dimen_10.h,
      ),
      height: Sizes.dimen_16.h,
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          text.t(context),
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
