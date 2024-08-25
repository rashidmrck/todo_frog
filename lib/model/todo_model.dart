/// `Todo` is a class representing a single task or todo item.
///
/// It contains the following properties:
/// - `id`: A unique identifier for the todo item.
/// - `title`: The title of the todo item.
/// - `description`: The description of the todo item.
/// - `completed`: A boolean indicating if the todo item is completed.
class Todo {
  /// Creates a new `Todo` instance.
  ///
  /// The `id`, `title`, and `description` parameters are required.
  /// The `completed` parameter defaults to `false`.
  Todo({
    required this.id,
    required this.title,
    required this.description,
    this.completed = false,
  });

  /// Creates a new `Todo` instance from a JSON map.
  ///
  /// The JSON map must contain the following keys:
  /// - `id`: A string representing the unique identifier.
  /// - `title`: A string representing the title.
  /// - `description`: A string representing the description.
  /// - `completed`: A boolean representing if the todo is completed.
  ///
  /// If any of these keys are missing or have invalid values,
  /// an exception will be thrown.
  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json['id'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        completed: json['completed'] as bool? ?? false,
      );

  /// The unique identifier for the todo item.
  final String id;

  /// The title of the todo item.
  final String title;

  /// The description of the todo item.
  final String description;

  /// A boolean indicating if the todo item is completed.
  final bool completed;

  /// Converts the `Todo` instance into a JSON map.
  ///
  /// The resulting map contains the following keys:
  /// - `id`: A string representing the unique identifier.
  /// - `title`: A string representing the title.
  /// - `description`: A string representing the description.
  /// - `completed`: A boolean representing if the todo is completed.
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'completed': completed,
      };
}
