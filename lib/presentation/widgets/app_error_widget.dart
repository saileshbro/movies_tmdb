import 'package:flutter/material.dart';
import 'package:movies_tmdb/common/constants/size_constants.dart';
import 'package:movies_tmdb/common/constants/translation_constants.dart';
import 'package:movies_tmdb/domain/entities/app_error.dart';
import 'package:movies_tmdb/common/extensions/extensions.dart';
import 'package:movies_tmdb/presentation/widgets/button.dart';
import 'package:wiredash/wiredash.dart';

class AppErrorWidget extends StatelessWidget {
  final AppErrorType appErrorType;
  final Function onRetry;

  const AppErrorWidget({
    Key key,
    @required this.appErrorType,
    @required this.onRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_32.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            (appErrorType == AppErrorType.api
                    ? TranslationConstants.somethingWentWrong
                    : TranslationConstants.checkNetwork)
                .t(context),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          ButtonBar(
            children: [
              Button(
                onPressed: onRetry,
                text: TranslationConstants.retry.t(context),
              ),
              Button(
                onPressed: () => Wiredash.of(context).show(),
                text: TranslationConstants.feedback.t(context),
              ),
            ],
          )
        ],
      ),
    );
  }
}
