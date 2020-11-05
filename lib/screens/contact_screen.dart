import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:messagly_clone_app/constants.dart';
import 'package:messagly_clone_app/cubit/menu_open_cubit.dart';
import 'package:messagly_clone_app/data/data.dart';
import 'package:messagly_clone_app/models/models.dart';
import 'package:messagly_clone_app/widgets/widgets.dart';

class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<Contact> _contactList = contacts;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            title: 'Contacts',
            leadingIcon: SvgPicture.asset('assets/icons/menu_icon.svg'),
            actionIcon: SvgPicture.asset('assets/icons/plus_icon.svg'),
            onPressLeading: () => context.bloc<MenuOpenCubit>().openMenu(),
            onPressAction: () => print('add new contact'),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverToBoxAdapter(
              child: Container(
                height: 35.0,
                color: Palette.grey.withOpacity(0.2),
                padding: const EdgeInsets.only(left: 10.0),
                child: TextField(
                  cursorColor: Palette.primary,
                  onChanged: (value) {
                    setState(() {
                      _contactList = contacts
                          .where((element) => element.name
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: kMediumTextStyle.copyWith(
                        fontSize: 14.0,
                        color: Palette.secondary.withOpacity(0.2)),
                    suffixIcon: Icon(
                      Icons.search,
                      size: 25,
                      color: Colors.black87.withOpacity(0.2),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 10.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final Contact contact = _contactList[index];
                  return ContactsList(contact: contact);
                },
                childCount: _contactList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
