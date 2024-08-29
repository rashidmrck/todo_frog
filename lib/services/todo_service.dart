import 'package:todo_mrck/interfaces/todo_interface.dart';
import 'package:todo_mrck/model/todo_model.dart';
import 'package:uuid/uuid.dart';

/// A service for managing todo items.
class TodoService implements TodoInterface {
  /// The saved todo items.
  final _savedTodos = <String, Todo>{};

  /// Adds a new todo item.
  ///
  /// The todo item is assigned a unique id.
  ///
  /// Returns the added todo item.
  @override
  Future<Todo> addTodo(Todo todo) async {
    const uuid = Uuid();
    final id = uuid.v4();
    _savedTodos[id] = todo;
    return todo;
  }

  /// Deletes a todo item with the given [id].
  ///
  /// Returns `true` if the item was found and deleted, `false` otherwise.
  @override
  Future<bool> deleteTodo(String id) async {
    if (_savedTodos.containsKey(id)) {
      _savedTodos.remove(id);
      return true;
    } else {
      return false;
    }
  }

  /// Retrieves a todo item with the given [id].
  ///
  /// Returns the todo item if found, `null` otherwise.
  @override
  Future<Todo?> getTodoById(String id) async {
    return _savedTodos[id];
  }

  /// Retrieves all saved todo items.
  ///
  /// Returns a map of todo items, where each key is the todo's id and the value
  /// is the todo item itself.
  @override
  Future<Map<String, Todo>> getTodos() async {
    return _savedTodos;
  }

  /// Updates a todo item with the given [id].
  ///
  /// The todo item must be found in the saved items.
  ///
  /// Returns the updated todo item if found, `null` otherwise.
  @override
  Future<Todo?> updateTodo(String id, Todo todo) async {
    if (_savedTodos.containsKey(id)) {
      final currentToDo = _savedTodos[id]!;
      _savedTodos[id] = todo.copyWith(
        title: todo.title ?? currentToDo.title,
        description: todo.description ?? currentToDo.description,
        completed: todo.completed ?? currentToDo.completed,
      );
      return todo;
    } else {
      return null;
    }
  }
}
