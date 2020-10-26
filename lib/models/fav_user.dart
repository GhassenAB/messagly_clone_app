import 'package:meta/meta.dart';

enum Availability {
  Online,
  Offline,
  Absent,
}

class FavouriteUser {
  final String image;
  final Availability availability;

  const FavouriteUser({
    @required this.image,
    @required this.availability,
  });
}
