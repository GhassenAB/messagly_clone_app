import 'package:flutter/material.dart';
import 'package:messagly_clone_app/constants.dart';

class ChatTabBar extends StatelessWidget {
  const ChatTabBar({
    Key key,
    @required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
        controller: _tabController,
        indicator: ShapeDecoration(
          shape: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          gradient: LinearGradient(
            colors: Palette.defaultGradient,
          ),
        ),
        labelColor: Color(0xFF3D3D3D),
        labelPadding: EdgeInsets.only(left: 0, right: 0),
        isScrollable: true,
        unselectedLabelColor: Color(0xFF3D3D3D).withOpacity(0.1),
        tabs: [
          _CustomTextTab(label: 'All Chats'),
          _TabSpacer(tabController: _tabController, index: 1),
          _CustomTextTab(label: 'Unread'),
          _TabSpacer(tabController: _tabController, index: 3),
          _CustomTextTab(label: 'Groups'),
        ]);
  }
}

class _CustomTextTab extends StatelessWidget {
  const _CustomTextTab({
    Key key,
    this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        child: Text(
          label,
          style: kSemiBoldTextStyle.copyWith(
            fontSize: 14.0,
          ),
        ),
        height: 50.0,
        color: Palette.background,
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(bottom: 1.0),
      ),
    );
  }
}

class _TabSpacer extends StatelessWidget {
  const _TabSpacer({
    Key key,
    @required this.index,
    @required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: GestureDetector(
        onTap: () {
          if (_tabController.index == index) if (_tabController.index >
              _tabController.previousIndex) {
            _tabController.index++;
          } else if (_tabController.index < _tabController.previousIndex) {
            _tabController.index--;
          }
        },
        child: Container(
          width: 30.0,
          color: Palette.background,
        ),
      ),
    );
  }
}
