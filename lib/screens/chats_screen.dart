import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:messagly_clone_app/screens/screens.dart';
import 'package:messagly_clone_app/widgets/widgets.dart';
import 'package:messagly_clone_app/constants.dart';
import 'package:messagly_clone_app/data/data.dart';
import 'package:messagly_clone_app/models/models.dart';

class ChatsScreen extends StatefulWidget {
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            title: 'Chats',
            leadingIcon: SvgPicture.asset('assets/icons/menu_icon.svg'),
            actionIcon: SvgPicture.asset('assets/icons/plus_icon.svg'),
            onPressLeading: () => print('Open side menu'),
            onPressAction: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContactsScreen(),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20.0, 15.0, 0.0, 12.0),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Favourites',
                style: kSemiBoldTextStyle.copyWith(
                    color: Color(0xFF3D3D3D), fontSize: 14.0),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FavouritesUsersList(),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 12.0),
            sliver: SliverToBoxAdapter(
              child: ChatTabBar(tabController: _tabController),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final ChatUser chat = chatUsers[index];
                return ChatList(chat: chat, index: index);
              },
              childCount: chatUsers.length,
            ),
          ),
        ],
      ),
    );
  }
}
