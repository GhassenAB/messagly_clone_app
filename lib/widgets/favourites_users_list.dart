import 'package:flutter/material.dart';
import 'package:messagly_clone_app/data/data.dart';
import 'package:messagly_clone_app/models/models.dart';

class FavouritesUsersList extends StatelessWidget {
  const FavouritesUsersList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: favouriteUsers.length,
        itemBuilder: (context, index) {
          final FavouriteUser user = favouriteUsers[index];
          Color availabilityColor;

          if (user.availability == Availability.Online) {
            availabilityColor = Color(0xFF7ED321);
          } else if (user.availability == Availability.Offline) {
            availabilityColor = Color(0xFFF5A623);
          } else {
            availabilityColor = Color(0xFF9B9B9B);
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.asset(
                    user.image,
                    height: 50.0,
                    width: 50.0,
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 10.0,
                    height: 10.0,
                    decoration: BoxDecoration(
                        color: availabilityColor,
                        border: Border.all(
                          width: 1.5,
                          color: Colors.white,
                        )),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
