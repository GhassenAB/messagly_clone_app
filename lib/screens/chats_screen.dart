import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            title: Text(
              'Chats',
              style: TextStyle(color: Color(0xFF232323), fontSize: 18.0),
            ),
            centerTitle: true,
            forceElevated: true,
            elevation: 2,
            leading: IconButton(
              icon: SvgPicture.asset('assets/icons/menu_icon.svg'),
              onPressed: () => print('Open side menu'),
            ),
            actions: [
              IconButton(
                icon: SvgPicture.asset('assets/icons/plus_icon.svg'),
                onPressed: () => print('New chat'),
              )
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20.0, 15.0, 0.0, 12.0),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Favourites',
                style: TextStyle(color: Color(0xFF3D3D3D), fontSize: 14.0),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 50.0,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: favouriteUsers.length,
                itemBuilder: (context, index) {
                  final FavouriteUser user = favouriteUsers[index];
                  Color availabilityColor;

                  if (user.availability == Availability.Online) {
                    availabilityColor = Color(0xFF7ED321);
                  } else if (user.availability == Availability.Offline) {
                    availabilityColor = Color(0xFFF5A623);
                  } else {
                    availabilityColor = Color(0xFF9B9B9B);
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Stack(
                      children: [
                        Image.asset(
                          user.image,
                          height: 50.0,
                          width: 50.0,
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 10.0,
                            height: 10.0,
                            decoration: BoxDecoration(
                                color: availabilityColor,
                                border: Border.all(
                                  width: 1.5,
                                  color: Colors.white,
                                )),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20.0, 15.0, 0.0, 12.0),
            sliver: SliverToBoxAdapter(
              child: TabBar(
                  controller: _tabController,
                  indicator: ShapeDecoration(
                    shape: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    gradient: LinearGradient(
                      colors: [Color(0xFF6A62EE), Color(0xFF56EDFF)],
                    ),
                  ),
                  labelColor: Color(0xFF3D3D3D),
                  labelPadding: EdgeInsets.only(left: 0, right: 0),
                  isScrollable: true,
                  unselectedLabelColor: Color(0xFFCDCDCD),
                  tabs: [
                    Tab(
                      child: Container(
                        child: Text(
                          'All Chats',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        height: 50.0,
                        color: Colors.white,
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    Tab(
                      child: GestureDetector(
                        onTap: () {
                          if (_tabController.index == 1) if (_tabController
                                  .index >
                              _tabController.previousIndex) {
                            _tabController.index++;
                          } else if (_tabController.index <
                              _tabController.previousIndex) {
                            _tabController.index--;
                          }
                        },
                        child: Container(
                          width: 30.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Text(
                          'Unread',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        height: 50.0,
                        color: Colors.white,
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    Tab(
                      child: GestureDetector(
                        onTap: () {
                          if (_tabController.index == 3) if (_tabController
                                  .index >
                              _tabController.previousIndex) {
                            _tabController.index++;
                          } else if (_tabController.index <
                              _tabController.previousIndex) {
                            _tabController.index--;
                          }
                        },
                        child: Container(
                          width: 30.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Text(
                          'Groups',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        height: 50.0,
                        color: Colors.white,
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
