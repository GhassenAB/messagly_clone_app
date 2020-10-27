import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messagly_clone_app/widgets/widgets.dart';
import 'package:messagly_clone_app/screens/screens.dart';

import '../constants.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40.0, 60.0, 40.0, 30.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.83),
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
                              'Welcome back',
                              style: kDefaultTextStyle,
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Please login to continue',
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
                              text: 'Mobile Number',
                              textInputType: TextInputType.phone,
                            ),
                            SizedBox(height: 40.0),
                            CustomInput(
                              text: 'Password',
                              textInputType: TextInputType.text,
                              isPasswordText: true,
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              width: size.width,
                              child: Text(
                                'Forgot Password ?',
                                textAlign: TextAlign.end,
                                style: kMediumTextStyle.copyWith(
                                  fontSize: 12.0,
                                  color: Color(0xFF12213F).withOpacity(0.5),
                                ),
                              ),
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
                              label: 'Login',
                              onPressed: () => print('Login'),
                            ),
                            SizedBox(height: 20.0),
                            HelpText(
                              noticeText: 'Don\'t have an account ?',
                              clickableText: 'Sign up here',
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen())),
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
