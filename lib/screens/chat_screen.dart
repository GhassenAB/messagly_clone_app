import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:messagly_clone_app/constants.dart';

class ChatScreen extends StatefulWidget {
  final String friendName;
  final String friendPic;

  const ChatScreen({Key key, this.friendName, this.friendPic})
      : super(key: key);
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String _rightIcon;
  ScrollController _scrollController = new ScrollController();
  double _scrollOffset = 0.0;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
          print('ScrollOffset  $_scrollOffset');
        });
      });
    setState(() {
      _rightIcon = 'assets/icons/emojis_Icon.svg';
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      appBar: AppBar(
        backgroundColor: Palette.background,
        elevation: 2,
        title: Text(
          widget.friendName,
          style: kMediumTextStyle.copyWith(
            color: Palette.primary,
            fontSize: 18.0,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/back_icon.svg'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/icons/options_icon.svg'),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    child: ListView(
                      controller: _scrollController,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 2.0,
                              width: 30.0,
                              color: Palette.grey.withOpacity(0.1),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Text(
                                'Today',
                                style: kMediumTextStyle.copyWith(
                                  fontSize: 12.0,
                                  color: Palette.primary.withOpacity(0.5),
                                ),
                              ),
                            ),
                            Container(
                              height: 2.0,
                              width: 30.0,
                              color: Palette.grey.withOpacity(0.1),
                            ),
                          ],
                        ),
                        MessageBubble(
                          image: widget.friendPic,
                          text: 'Hey babe, what’s up?',
                          time: '12:00pm',
                        ),
                        MessageBubble(
                          text: 'Nothing much, what are you upto nowadays?',
                          time: '12:03pm',
                          isMe: true,
                        ),
                        MessageBubble(
                          text: 'Let’s meet up tomorrow? Tiffanys?',
                          time: '12:03pm',
                          isMe: true,
                        ),
                        MessageBubble(
                          image: widget.friendPic,
                          text: 'Sure !',
                          time: '12:04pm',
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: Opacity(
                      opacity: _scrollOffset == 0.0 ? 0 : 1,
                      child: Container(
                        height: 60.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.white,
                                Colors.white.withOpacity(0.0),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    color: Palette.grey.withOpacity(0.2),
                    blurRadius: 2,
                  )
                ],
              ),
              child: Container(
                height: 50.0,
                color: Colors.white,
                child: Row(
                  children: [
                    IconButton(
                      icon: SvgPicture.asset('assets/icons/add_pic_icon.svg'),
                    ),
                    Expanded(
                      child: TextField(
                        onTap: () {
                          setState(() {
                            _scrollController.animateTo(
                              _scrollController.position.maxScrollExtent,
                              curve: Curves.easeOut,
                              duration: const Duration(milliseconds: 200),
                            );
                          });
                        },
                        onChanged: (value) {
                          setState(
                            () {
                              if (value.length != 0) {
                                _rightIcon = 'assets/icons/send_icon.svg';
                              } else {
                                _rightIcon = 'assets/icons/emojis_Icon.svg';
                              }
                            },
                          );
                        },
                        decoration: InputDecoration(
                          hintText: 'Write something here …',
                          hintStyle: kRegularTextStyle.copyWith(
                              fontSize: 14.0, color: Palette.grey),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                        style: kMediumTextStyle.copyWith(
                          fontSize: 14.0,
                          color: Color(0xFF3D3D3D),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: SvgPicture.asset(_rightIcon),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    Key key,
    @required this.text,
    @required this.time,
    this.isMe = false,
    this.image,
  }) : super(key: key);

  final String image;
  final String text;
  final String time;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return !isMe
        ? Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Image(
                    image: AssetImage(image),
                    height: 20.0,
                    width: 20.0,
                  ),
                ),
                SizedBox(width: 5.0),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0),
                            bottomLeft: Radius.circular(5.0),
                          ),
                          gradient: LinearGradient(
                            colors: Palette.defaultGradient,
                            stops: [0, 1],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Text(
                          text,
                          maxLines: 10,
                          style: kMediumTextStyle.copyWith(
                              fontSize: 14.0, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 3.0),
                      Text(
                        time,
                        style: kMediumTextStyle.copyWith(
                          fontSize: 10.0,
                          color: Palette.primary.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 25.0, top: 20.0),
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    bottomRight: Radius.circular(5.0),
                    bottomLeft: Radius.circular(5.0),
                  ),
                  gradient: LinearGradient(
                    colors: [Colors.white, Color(0xFFE9E9E9)],
                    stops: [0, 1],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 0),
                      color: Palette.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 7,
                    )
                  ],
                ),
                child: Text(
                  text,
                  maxLines: 10,
                  style: kMediumTextStyle.copyWith(
                      fontSize: 14.0, color: Color(0xFF3D3D3D)),
                ),
              ),
              SizedBox(height: 3.0),
              Text(
                time,
                style: kMediumTextStyle.copyWith(
                  fontSize: 10.0,
                  color: Palette.primary.withOpacity(0.5),
                ),
              ),
            ],
          );
  }
}
