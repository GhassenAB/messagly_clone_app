import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:messagly_clone_app/constants.dart';
import 'package:messagly_clone_app/cubit/menu_open_cubit.dart';
import 'package:messagly_clone_app/data/data.dart';
import 'package:messagly_clone_app/widgets/custom_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Palette.background,
      body: Builder(builder: (BuildContext context) {
        return CustomScrollView(
          slivers: [
            CustomAppBar(
              title: 'Profile',
              leadingIcon: SvgPicture.asset('assets/icons/menu_icon.svg'),
              onPressLeading: () => context.bloc<MenuOpenCubit>().openMenu(),
            ),
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: Palette.defaultGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                height: size.height * 0.35,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        currentUser.image,
                      ),
                    ),
                    Text(
                      currentUser.name,
                      style: kMediumTextStyle.copyWith(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 11),
                    Text(
                      currentUser.phone,
                      style: kMediumTextStyle.copyWith(
                        fontSize: 16.0,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  _CustomBox(
                    title: 'Status',
                    content: currentUser.status,
                  ),
                  _CustomBox(
                    title: 'Profile Link',
                    content: currentUser.profileLink,
                    buttonLabel: 'Copy',
                    onTap: () => Clipboard.setData(
                      new ClipboardData(text: currentUser.profileLink),
                    ).then((_) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Profile link copied !'),
                        ),
                      );
                    }),
                  ),
                  _CustomBox(
                    title: 'Account',
                    content: currentUser.isActive ? 'Active' : 'Disabled',
                    buttonLabel: 'Disabled',
                    onTap: () => print('Disable account'),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

class _CustomBox extends StatelessWidget {
  const _CustomBox({
    Key key,
    @required this.title,
    @required this.content,
    this.buttonLabel = '',
    this.onTap,
  }) : super(key: key);

  final String title;
  final String content;
  final String buttonLabel;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0, top: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: kMediumTextStyle_2,
          ),
          SizedBox(height: 13),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  content,
                  style: kRegularTextStyle_2,
                ),
                buttonLabel.length != 0
                    ? GestureDetector(
                        onTap: onTap,
                        child: Text(
                          buttonLabel,
                          style: kRegularTextStyle.copyWith(
                            fontSize: 16.0,
                            color: Palette.primary.withOpacity(0.2),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          SizedBox(height: 8),
          Divider(
            thickness: 1,
            color: Palette.grey.withOpacity(0.1),
          )
        ],
      ),
    );
  }
}
