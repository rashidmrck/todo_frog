import 'package:todo_mrck/interfaces/todo_interface.dart';
import 'package:todo_mrck/model/todo_model.dart';
import 'package:uuid/uuid.dart';

class TodoService implements TodoInterface {
  final _savedTodos = <String, Todo>{};
  @override
  Future<Todo> addTodo(Todo todo) {
    // TODO: implement addTodo
    const uuid = Uuid();
    final id = uuid.v4();
    _savedTodos[id] = todo;
    return Future.value(todo);
  }

  @override
  Future<void> deleteTodo(String id) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<Todo?> getTodoById(String id) {
    // TODO: implement getTodoById
    throw UnimplementedError();
  }

  @override
  Future<Map<String, Todo>> getTodos() {
    return Future.value(_savedTodos);
  }

  @override
  Future<Todo> updateTodo(String id, Todo todo) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }
}
