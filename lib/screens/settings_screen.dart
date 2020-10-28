import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:messagly_clone_app/constants.dart';
import 'package:messagly_clone_app/widgets/custom_app_bar.dart';
import 'package:messagly_clone_app/widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            title: 'Settings',
            leadingIcon: SvgPicture.asset('assets/icons/menu_icon.svg'),
            onPressLeading: () => print('Open side menu'),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
            sliver: SliverToBoxAdapter(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Privacy',
                      style: kMediumTextStyle_2,
                    ),
                    _CustomBox(
                      title: 'Be Discoverable By Others',
                    ),
                    _CustomBox(
                      title: 'Show Status',
                    ),
                    _CustomBox(
                      title: 'Show Display Picture',
                      withDivider: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 20.0, top: 50.0),
            sliver: SliverToBoxAdapter(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Notifications',
                      style: kMediumTextStyle_2,
                    ),
                    _CustomBox(
                      title: 'Sounds',
                    ),
                    _CustomBox(
                      title: 'Vibration',
                    ),
                    _CustomBox(
                      title: 'Message Preview',
                      withDivider: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 20.0, top: 50.0),
            sliver: SliverToBoxAdapter(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Account',
                      style: kMediumTextStyle_2,
                    ),
                    _CustomBox(
                      title: 'Update Mobile Number',
                      withButton: false,
                    ),
                    _CustomBox(
                      title: 'Change Password',
                      withButton: false,
                    ),
                    _CustomBox(
                      title: 'Delete Account',
                      withDivider: false,
                      withRedColor: true,
                      withButton: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomBox extends StatelessWidget {
  const _CustomBox({
    Key key,
    this.title,
    this.withDivider = true,
    this.withButton = true,
    this.withRedColor = false,
  }) : super(key: key);

  final String title;
  final bool withDivider;
  final bool withButton;
  final bool withRedColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: withButton ? null : () => print(title),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, right: 20.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: withRedColor
                        ? kRegularTextStyle_2.copyWith(color: Color(0xFFD0021B))
                        : kRegularTextStyle_2,
                  ),
                  withButton ? CustomSwitch() : Container(),
                ],
              ),
            ),
          ),
          withDivider
              ? Column(
                  children: [
                    SizedBox(height: 8.0),
                    Divider(
                      thickness: 1,
                      color: Palette.grey.withOpacity(0.1),
                    ),
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
