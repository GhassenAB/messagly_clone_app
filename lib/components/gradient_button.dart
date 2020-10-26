import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key key,
    @required this.label,
    @required this.onPressed,
  }) : super(key: key);

  final String label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FlatButton(
      onPressed: onPressed,
      padding: EdgeInsets.all(0),
      child: Container(
        alignment: Alignment.center,
        height: 50.0,
        width: size.width - 80.0,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(2.5, 2.5),
              blurRadius: 10,
              color: Colors.black87.withOpacity(0.2),
            ),
          ],
          gradient: LinearGradient(
            colors: [
              Color(0xFF6A62EE),
              Color(0xFF56EDFF),
            ],
            stops: [0.2, 0.9],
          ),
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
    );
  }
}
