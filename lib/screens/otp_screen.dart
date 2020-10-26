import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:messagly_clone_app/components/components.dart';
import 'package:messagly_clone_app/constants.dart';
import 'package:messagly_clone_app/screens/screens.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  bool _keyBoredVisible = false;

  @override
  void initState() {
    super.initState();
    KeyboardVisibility.onChange.listen((bool visible) {
      setState(() {
        _keyBoredVisible = visible;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40.0, 60.0, 40.0, 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/logo_gradient.png'),
                    SizedBox(height: 18.0),
                    Text(
                      'Please enter the OTP received.',
                      style: kDefaultTextStyle,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: _keyBoredVisible ? 50.0 : 20.0,
                  ),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 4,
                    keyboardType: TextInputType.number,
                    onChanged: (value) => print(value),
                    pinTheme: PinTheme(
                      selectedColor: Colors.grey[350],
                      activeColor: Colors.grey[350],
                      inactiveColor: Colors.grey[350],
                      borderWidth: 1,
                    ),
                    textStyle: TextStyle(fontSize: 18, height: 2.5),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GradientButton(
                      label: 'Verify',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SetupProfileScreen()),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    HelpText(
                      noticeText: 'Did note receive code ?',
                      clickableText: 'Resend OTP',
                      onTap: () => print('Resend OTP'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String pin, BuildContext context) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      content: Container(
        height: 80.0,
        child: Center(
          child: Text(
            'Pin Submitted. Value: $pin',
            style: const TextStyle(fontSize: 25.0),
          ),
        ),
      ),
      backgroundColor: Colors.deepPurpleAccent,
    );
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
