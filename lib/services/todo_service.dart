import 'package:todo_mrck/interfaces/todo_interface.dart';
import 'package:todo_mrck/model/todo_model.dart';

class TodoService implements TodoInterface {
  final _savedTodos = <String, Todo>{};
  @override
  Future<Todo> addTodo(Todo todo) {
    // TODO: implement addTodo
    throw UnimplementedError();
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
  Future<List<Todo>> getTodos() {
    // TODO: implement getTodos
    throw UnimplementedError();
  }

  @override
  Future<Todo> updateTodo(String id, Todo todo) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }
}
