import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:messagly_clone_app/constants.dart';
import 'package:messagly_clone_app/widgets/widgets.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            title: 'About Us',
            leadingIcon: SvgPicture.asset('assets/icons/menu_icon.svg'),
            onPressLeading: () => print('Open Side menu'),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About the app',
                    style: kMediumTextStyle_2,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Mauris non tempor quam, et lacinia sapien. Mauris accumsan eros eget libero posuere vulputate. Etiam elit elit, elementum sed varius at, adipiscing vitae est. Sed nec felis pellentesque, lacinia dui sed, ultricies sapien. Pellentesque orci lectus, consectetur vel posuere posuere, rutrum eu ipsum. Aliquam eget odio sed ligula iaculis consequat at eget orci.',
                    style: kRegularTextStyle_2.copyWith(height: 2),
                  )
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Version',
                    style: kMediumTextStyle_2,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '3.2.17 installed on 24-7-17.',
                    style: kRegularTextStyle_2,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
