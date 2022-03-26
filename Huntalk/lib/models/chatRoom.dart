class ChatRoom {
  final String id;
  final List userList;
  final String timeStamp;

  ChatRoom({
    required this.id,
    required this.userList,
    required this.timeStamp,
  });

  factory ChatRoom.fromJson(json) => ChatRoom(
    id: json['id'],
    userList: json['userList'],
    timeStamp: json['timeStamp'],
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userList':userList,
      'timeStamp':timeStamp,
    };
  }
}
