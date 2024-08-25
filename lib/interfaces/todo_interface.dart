import 'package:todo_mrck/model/todo_model.dart';

/// `TodoService` is an abstract class representing a service
///  for managing todo items.
///
/// It provides methods for getting all todos, adding a new todo,
/// updating an existing todo,
/// and deleting a todo.
///
/// Implementations of this class are responsible for implementing these methods
/// to provide the actual functionality for managing todo items.
abstract class TodoInterface {
  /// Adds a new todo item.
  ///
  /// The [todo] parameter represents the todo item to be added.
  /// Returns a [Future] that completes with the added [Todo] object.
  Future<Todo> addTodo(Todo todo);

  /// Deletes a todo item.
  ///
  /// The [id] parameter represents the unique identifier of the todo
  /// item to be deleted.
  /// Returns a [Future] that completes with `void`.
  Future<void> deleteTodo(String id);

  /// Retrieves a todo item by its unique identifier.
  ///
  /// The [id] parameter represents the unique identifier of the todo item.
  /// Returns a [Future] that completes with the [Todo] object if found,
  /// otherwise null.
  Future<Todo?> getTodoById(String id);

  /// Retrieves all the todo items.
  ///
  /// Returns a [Future] that completes with a list of [Todo] objects.
  Future<Map<String, Todo>> getTodos();

  /// Updates an existing todo item.
  ///
  /// The [todo] parameter represents the updated todo item.
  /// The [id] parameter represents the unique identifier of the todo
  /// item to be updated.
  /// Returns a [Future] that completes with the updated [Todo] object.
  Future<Todo> updateTodo(String id, Todo todo);
}
