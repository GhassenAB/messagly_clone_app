import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:messagly_clone_app/constants.dart';

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
    Color customColor = Palette.grey.withOpacity(0.1);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: kRegularTextStyle.copyWith(
            fontSize: 14.0,
            color: Palette.secondary.withOpacity(0.2),
          ),
        ),
        TextField(
          obscureText: isPasswordText ? true : false,
          keyboardType: textInputType,
          decoration: InputDecoration(
            suffixIcon: isPasswordText
                ? Icon(
                    MdiIcons.eyeOffOutline,
                    color: customColor,
                  )
                : null,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: customColor,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: customColor,
              ),
            ),
          ),
          style: kMediumTextStyle.copyWith(
            fontSize: 14.0,
            color: Palette.secondary,
          ),
        ),
      ],
    );
  }
}
