import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messagly_clone_app/widgets/widgets.dart';
import 'package:messagly_clone_app/screens/screens.dart';

import '../constants.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40.0, 60.0, 40.0, 30.0),
            child: Container(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: size.height * 0.83),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('assets/images/logo_gradient.png'),
                            SizedBox(height: 18.0),
                            Text(
                              'Join us today!',
                              style: kDefaultTextStyle,
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Please provide your basic info',
                              style: kDefaultTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomInput(
                              text: 'Your name',
                              textInputType: TextInputType.name,
                            ),
                            SizedBox(height: 40.0),
                            CustomInput(
                              text: 'Mobile Number',
                              textInputType: TextInputType.phone,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GradientButton(
                              label: 'Send OTP',
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OTPScreen()),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Opacity(
                              opacity: 0,
                              child: HelpText(
                                noticeText: 'Don\'t have an account ?',
                                clickableText: 'Sign up here',
                                onTap: () => print('Sign up here'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
