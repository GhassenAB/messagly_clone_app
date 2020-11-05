import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagly_clone_app/cubit/menu_open_cubit.dart';
import 'package:messagly_clone_app/screens/screens.dart';

class MenuFrame extends StatefulWidget {
  @override
  _MenuFrameState createState() => _MenuFrameState();
}

class _MenuFrameState extends State<MenuFrame>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> scaleAnimation, smallerScaleAnimation;
  Duration duration = Duration(milliseconds: 200);
  List<Animation> scaleAnimations;
  Map<int, Widget> screens;
  List<Widget> screenSnapshot;
  List<Widget> neededScreens = [];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: duration);

    scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.8).animate(_animationController);

    smallerScaleAnimation =
        Tween<double>(begin: 1.0, end: 0.7).animate(_animationController);

    scaleAnimations = [
      Tween<double>(begin: 1.0, end: 0.8).animate(_animationController),
      Tween<double>(begin: 1.0, end: 0.75).animate(_animationController),
      Tween<double>(begin: 1.0, end: 0.7).animate(_animationController),
    ];

    _animationController.reverse();

    neededScreens = [
      ScreenContainer(child: ChatsScreen()),
      ScreenContainer(child: ContactsScreen()),
      ScreenContainer(child: ProfileScreen()),
      ScreenContainer(child: SettingsScreen()),
      ScreenContainer(child: AboutUsScreen()),
    ];

    screens = {
      0: neededScreens[0],
      1: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
      2: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.6),
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
    };
    screenSnapshot = screens.values.toList();
  }

  List<Widget> finalStack() {
    List<Widget> stackToReturn = [];
    stackToReturn.add(MenuScreen(
      menuCallback: (selectedIndex) {
        setState(() {
          screenSnapshot = screens.values.toList();
          screenSnapshot.removeAt(0);
          final selectedWidget = neededScreens[selectedIndex];
          screenSnapshot.insert(0, selectedWidget);
          if (selectedIndex == 3) {
            screenSnapshot.removeAt(2);
          } else if (selectedIndex == 4) {
            screenSnapshot.removeAt(2);
            screenSnapshot.removeAt(1);
          }
        });
      },
    ));

    screenSnapshot
        .asMap()
        .entries
        .map((screenEntry) => buildScreenStack(screenEntry.key))
        .toList()
        .reversed
      ..forEach((screen) {
        stackToReturn.add(screen);
      });

    return stackToReturn;
  }

  Widget buildScreenStack(int position) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return BlocConsumer<MenuOpenCubit, bool>(
      listener: (context, menuOpen) {
        setState(() {
          menuOpen
              ? _animationController.forward()
              : _animationController.reverse();
        });
      },
      builder: (context, menuOpen) {
        return AnimatedPositioned(
          duration: duration,
          top: 0,
          bottom: 0,
          left: menuOpen ? deviceWidth * 0.65 - (position * 25) : 0.0,
          right: menuOpen ? deviceWidth * -0.45 + (position * 25) : 0.0,
          child: ScaleTransition(
            scale: scaleAnimations[position],
            child: GestureDetector(
              onTap: () {
                if (menuOpen) {
                  context.bloc<MenuOpenCubit>().closeMenu();
                }
              },
              child: AbsorbPointer(
                absorbing: menuOpen,
                child: Stack(
                  children: <Widget>[
                    Material(
                      animationDuration: duration,
                      borderRadius: BorderRadius.circular(menuOpen ? 4.0 : 0.0),
                      color: Colors.transparent,
                      child: menuOpen
                          ? SafeArea(child: screenSnapshot[position])
                          : screenSnapshot[position],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MenuOpenCubit(),
      child: Stack(
        children: finalStack(),
      ),
    );
  }
}

class ScreenContainer extends StatelessWidget {
  const ScreenContainer({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}
