import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HelpText extends StatelessWidget {
  const HelpText({
    Key key,
    @required this.noticeText,
    @required this.clickableText,
    @required this.onTap,
  }) : super(key: key);

  final String noticeText;
  final String clickableText;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      width: size.width,
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: '$noticeText ',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12.0,
            ),
          ),
          TextSpan(
              text: clickableText,
              style: TextStyle(
                color: Color(0xFF6968EF),
                fontSize: 12.0,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTap),
        ]),
      ),
    );
  }
}
