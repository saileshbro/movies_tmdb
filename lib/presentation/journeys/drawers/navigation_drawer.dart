import 'package:flutter/material.dart';
import 'package:movies_tmdb/common/constants/languages.dart';
import 'package:movies_tmdb/common/constants/size_constants.dart';
import 'package:movies_tmdb/common/constants/translation_constants.dart';
import 'package:movies_tmdb/common/extensions/extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_tmdb/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:movies_tmdb/presentation/journeys/drawers/navigation_expanded_list_item.dart';
import 'package:movies_tmdb/presentation/journeys/drawers/navigation_list_item.dart';
import 'package:movies_tmdb/presentation/widgets/app_dialog.dart';
import 'package:movies_tmdb/presentation/widgets/logo.dart';
import 'package:wiredash/wiredash.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.dimen_300.w,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Theme.of(context).primaryColor.withOpacity(0.7),
          blurRadius: 4,
        )
      ]),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: Sizes.dimen_8.h,
                bottom: Sizes.dimen_18.h,
                left: Sizes.dimen_8.w,
                right: Sizes.dimen_8.w,
              ),
              child: Logo(
                height: Sizes.dimen_20.h,
              ),
            ),
            NavigationListItem(
              title: TranslationConstants.favoriteMovies.t(context),
              onPressed: () {},
            ),
            NavigationExpandedListItem(
              title: TranslationConstants.language.t(context),
              onPressed: (index) {
                context.bloc<LanguageBloc>().add(
                      ToggleLanguageEvent(
                        Languages.langages[index],
                      ),
                    );
              },
              children: Languages.langages.map((e) => e.value).toList(),
            ),
            NavigationListItem(
              title: TranslationConstants.feedback.t(context),
              onPressed: () {
                Navigator.pop(context);
                Wiredash.of(context).show();
              },
            ),
            NavigationListItem(
              title: TranslationConstants.about.t(context),
              onPressed: () {
                Navigator.pop(context);
                _showDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      child: AppDialog(
        title: TranslationConstants.about,
        description: TranslationConstants.aboutDescription,
        buttonText: TranslationConstants.okay,
        image: Image.asset(
          "assets/pngs/tmdb_logo.png",
          height: Sizes.dimen_32.h,
        ),
      ),
    );
  }
}
