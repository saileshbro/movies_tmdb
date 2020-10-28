import 'package:flutter/material.dart';
import 'package:movies_tmdb/presentation/journeys/drawers/navigation_sub_list_item.dart';

class NavigationExpandedListItem extends StatelessWidget {
  final String title;
  final Function(int index) onPressed;
  final List<String> children;

  const NavigationExpandedListItem({
    Key key,
    @required this.title,
    @required this.onPressed,
    @required this.children,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Theme.of(context).primaryColor.withOpacity(0.7),
          blurRadius: 2,
        )
      ]),
      child: ExpansionTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        children: children
            .asMap()
            .entries
            .map(
              (e) => NavigationSubListItem(
                title: e.value,
                onPressed: () => onPressed(e.key),
              ),
            )
            .toList(),
      ),
    );
  }
}
