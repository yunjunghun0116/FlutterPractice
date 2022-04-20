class Todo {
  final String id;
  final DateTime dateTime;
   final String todo;
   int state;

  Todo({
    required this.id,
    required this.dateTime,
    required this.todo,
    required this.state,
  });

  factory Todo.fromJson(json) => Todo(
    id: json['id'],
        dateTime: json['dateTime'],
        todo: json['todo'],
    state: json['state'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'dateTime': dateTime,
      'todo': todo,
      'state': state,
    };
  }

  void updateState(){
    if(state !=2){
      state++;
    }
  }

}
