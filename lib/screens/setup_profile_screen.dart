import 'package:flutter/material.dart';
import 'package:messagly_clone_app/components/components.dart';
import 'package:messagly_clone_app/constants.dart';

class SetupProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/logo_gradient.png'),
                        SizedBox(height: 18.0),
                        Text(
                          'Welcome to Messagly!',
                          style: kDefaultTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.grey[100],
                          height: 120.0,
                          width: 120.0,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 3.6),
                            child: Column(
                              children: [
                                Flexible(
                                  flex: 4,
                                  child: Image.asset(
                                      "assets/images/user_avatar.png"),
                                ),
                                Flexible(
                                  child: Center(
                                    child: Text(
                                      'Setup Profile Photo',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 10),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        CustomInput(
                          text: 'New Password',
                          textInputType: TextInputType.text,
                          isPasswordText: true,
                        ),
                        SizedBox(height: 40.0),
                        CustomInput(
                          text: 'Confirm Password',
                          textInputType: TextInputType.text,
                          isPasswordText: true,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
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
                          Opacity(
                            opacity: 0.0,
                            child: HelpText(
                              noticeText: 'Did note receive code ?',
                              clickableText: 'Resend OTP',
                              onTap: () => print('Resend OTP'),
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
    );
  }
}
