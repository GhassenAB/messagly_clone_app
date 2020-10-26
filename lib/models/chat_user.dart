import 'package:meta/meta.dart';

class ChatUser {
  final String name;
  final String image;
  final String lastMessage;
  final String timeReceive;

  ChatUser({
    @required this.name,
    @required this.image,
    @required this.lastMessage,
    @required this.timeReceive,
  });
}
