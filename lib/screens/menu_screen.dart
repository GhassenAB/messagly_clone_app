import 'package:flutter/material.dart';
import 'package:messagly_clone_app/constants.dart';
import 'package:messagly_clone_app/data/data.dart';

class MenuScreen extends StatefulWidget {
  final Function(int) menuCallback;

  MenuScreen({this.menuCallback});
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int selectedMenuIndex = 0;

  List<String> menuItems = [
    'Chats',
    'Contacts',
    'Profile',
    'Settings',
    'About App',
  ];

  Widget buildMenuRow(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedMenuIndex = index;
          widget.menuCallback(index);
        });
      },
      child: Container(
        height: 40.0,
        width: 200.0,
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        padding: const EdgeInsets.only(left: 30.0),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            gradient: selectedMenuIndex == index
                ? LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0.0),
                    ],
                  )
                : null),
        child: Text(
          menuItems[index],
          style: kMediumTextStyle.copyWith(fontSize: 18.0, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: Container(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 40.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: size.height * 0.2,
                  margin: const EdgeInsets.only(left: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(currentUser.image)),
                        height: 70.0,
                        width: 70.0,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        currentUser.name,
                        style: kMediumTextStyle_2.copyWith(color: Colors.white),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        width: 175.0,
                        height: 1,
                        color: Colors.white.withOpacity(0.12),
                      )
                    ],
                  ),
                ),
                Container(
                  height: size.height * 0.6,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: menuItems
                        .asMap()
                        .entries
                        .map((mapEntry) => buildMenuRow(mapEntry.key))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: Palette.defaultGradient)),
      ),
    );
  }
}
