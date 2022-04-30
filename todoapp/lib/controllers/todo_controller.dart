import 'package:get/get.dart';
import 'package:todoapp/models/todo.dart';
import 'package:uuid/uuid.dart';

class TodoController extends GetxController {
  static TodoController get to => Get.find();

  final RxList<Todo> _todoList = <Todo>[].obs;
  RxList<Todo> get todoList => _todoList; // 리스트의 크기->증가,감소, 내부객체에대한 감지 X

  void addTodo({required DateTime dateTime, required String todo}) {
    _todoList.add(
      Todo(
        id: const Uuid().v4(),
        dateTime: dateTime,
        todo: todo,
        state: 0,
      ),
    );
  }

  void todoStateUpdate({required String id}) {
    _todoList.firstWhere((element) => element.id == id).updateState();
    _todoList.refresh();
  }

  void deleteTodo({required String id}) {
    // _todoList.value = _todoList.where((element) => element.id != id).toList();
    _todoList.removeWhere((element) => element.id == id);
  }
}
