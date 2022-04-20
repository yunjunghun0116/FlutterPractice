import 'package:get/get.dart';
import 'package:todoapp/models/todo.dart';
import 'package:uuid/uuid.dart';

class TodoController extends GetxController {
  static TodoController get to => Get.find();

  final RxList<Todo> _todoList = <Todo>[].obs;
  RxList<Todo> get todoList => _todoList;

  void addTodo({required DateTime dateTime, required String todo}) {
    _todoList.add(Todo(
      id: const Uuid().v4(),
      dateTime: dateTime,
      todo: todo,
      state: 0,
    ));
    _todoList.refresh();
  }
  void todoStateUpdate({required String id}){
    _todoList.firstWhere((element) => element.id == id).updateState();
    _todoList.refresh();
  }
}
