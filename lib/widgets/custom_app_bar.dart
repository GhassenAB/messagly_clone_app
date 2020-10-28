import 'package:flutter/material.dart';
import 'package:messagly_clone_app/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
    this.title,
    this.actionIcon,
    this.onPressAction,
    this.onPressLeading,
    this.leadingIcon,
  }) : super(key: key);

  final String title;
  final Widget leadingIcon;
  final Widget actionIcon;
  final Function onPressAction;
  final Function onPressLeading;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Palette.background,
      title: Text(
        title,
        style: kMediumTextStyle.copyWith(
          color: Palette.primary,
          fontSize: 18.0,
        ),
      ),
      centerTitle: true,
      forceElevated: true,
      floating: true,
      elevation: 2,
      leading: leadingIcon != null
          ? IconButton(
              icon: leadingIcon,
              onPressed: onPressLeading,
            )
          : Container(),
      actions: [
        actionIcon != null
            ? IconButton(
                icon: actionIcon,
                onPressed: onPressAction,
              )
            : Container(),
      ],
    );
  }
}
