import 'package:flutter/material.dart';
import 'package:messagly_clone_app/constants.dart';
import 'package:messagly_clone_app/models/models.dart';
import 'package:messagly_clone_app/screens/chat_screen.dart';

class ChatList extends StatelessWidget {
  const ChatList({
    Key key,
    @required this.chat,
    @required this.index,
  }) : super(key: key);

  final ChatUser chat;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ChatScreen(friendName: chat.name, friendPic: chat.image),
        ),
      ),
      child: Container(
        decoration: index == 0
            ? BoxDecoration(boxShadow: [
                BoxShadow(
                  blurRadius: 7,
                  offset: Offset(0, 0),
                  color: Palette.grey.withOpacity(0.2),
                  spreadRadius: 2,
                )
              ])
            : null,
        child: Container(
          color: index == 0 ? Palette.background : null,
          height: 70.0,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 50.0,
                      width: 50.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          chat.image,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              chat.name,
                              style: kMediumTextStyle.copyWith(
                                fontSize: 16,
                                color: Color(0xFF619CF5),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    chat.lastMessage,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: kMediumTextStyle.copyWith(
                                      fontSize: 14,
                                      color: index == 0
                                          ? Color(0xFF3B3B3B)
                                          : Color(0xFF3B3B3B).withOpacity(0.5),
                                    ),
                                  ),
                                ),
                                Text(
                                  chat.timeReceive,
                                  style: kMediumTextStyle.copyWith(
                                    fontSize: 12,
                                    color: Color(0xFF3B3B3B).withOpacity(0.2),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Divider(
                    thickness: 1,
                    color: Palette.grey.withOpacity(0.1),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
