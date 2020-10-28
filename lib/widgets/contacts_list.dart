import 'package:flutter/material.dart';
import 'package:messagly_clone_app/constants.dart';
import 'package:messagly_clone_app/models/models.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({
    Key key,
    @required this.contact,
  }) : super(key: key);

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                child: Image.asset(contact.image),
                borderRadius: BorderRadius.circular(5.0),
              ),
              SizedBox(width: 10.0),
              Text(
                contact.name,
                style: kMediumTextStyle.copyWith(
                    fontSize: 16, color: Color(0xFF3D3D3D)),
              )
            ],
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Divider(
                thickness: 1,
                color: Palette.grey.withOpacity(0.1),
              ),
            ),
          )
        ],
      ),
    );
  }
}
