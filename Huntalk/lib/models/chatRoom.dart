class ChatRoom {
  final String id;
  final List userList;
  final List chatList;
  final String timeStamp;

  ChatRoom({
    required this.id,
    required this.userList,
    required this.chatList,
    required this.timeStamp,
  });

  factory ChatRoom.fromJson(json) => ChatRoom(
    id: json['id'],
    userList: json['userList'],
    chatList: json['chatList'],
    timeStamp: json['timeStamp'],
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userList':userList,
      'chatList':chatList,
      'timeStamp':timeStamp,
    };
  }
}
