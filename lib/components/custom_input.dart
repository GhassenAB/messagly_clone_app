import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    Key key,
    @required this.text,
    @required this.textInputType,
    this.isPasswordText = false,
  }) : super(key: key);

  final String text;
  final TextInputType textInputType;
  final bool isPasswordText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 14.0,
            color: Color(0xFF979797),
          ),
        ),
        TextField(
          obscureText: isPasswordText ? true : false,
          keyboardType: textInputType,
          decoration: InputDecoration(
            suffixIcon: isPasswordText
                ? Icon(MdiIcons.eyeOffOutline, color: Colors.grey[350])
                : null,
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
