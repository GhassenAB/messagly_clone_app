import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _pressed = !_pressed;
        });
      },
      child: Image(
        image: _pressed
            ? Image.asset('assets/icons/switch_on.png').image
            : Image.asset('assets/icons/switch_off.png').image,
        height: 20.0,
        width: 40.0,
      ),
    );
  }
}
