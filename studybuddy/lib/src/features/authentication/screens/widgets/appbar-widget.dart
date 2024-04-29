import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studybuddy/src/utils/theme/theme.dart';

AppBar buildAppBar(BuildContext context,
    {required Text title, required leading, required List<Widget> actions}) {
  final isDarkMode = Theme
      .of(context)
      .brightness == Brightness.dark;
  const icon = CupertinoIcons.moon_stars;

  return AppBar(
    title: title,
    centerTitle: true,
    leading: leading,
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: (actions.length) > 0 ? actions : [
      ThemeSwitcher(
        builder: (context) =>
            IconButton(
              icon: const Icon(icon),
              onPressed: () {
                final theme =
                isDarkMode ? SAppTheme.lightTheme : SAppTheme.darkTheme;

                final switcher = ThemeSwitcher.of(context)!;
                switcher.changeTheme(theme: theme);
              },
            ),
      ),
    ],
  );
}
