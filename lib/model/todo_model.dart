/// `Todo` is a class representing a single task or todo item.
///
/// It contains the following properties:
/// - `title`: The title of the todo item.
/// - `description`: The description of the todo item.
/// - `completed`: A boolean indicating if the todo item is completed.
class Todo {

  /// Creates a new `Todo` instance.
  ///
  /// The `title`, and `description` parameters are required.
  /// The `completed` parameter defaults to `false`.
  Todo({
    this.title,
    this.description,
    this.completed = false,
  });

  /// Creates a new `Todo` instance from a JSON map.
  ///
  /// The JSON map must contain the following keys:
  /// - `title`: A string representing the title.
  /// - `description`: A string representing the description.
  /// - `completed`: A boolean representing if the todo is completed.
  ///
  /// If any of these keys are missing or have invalid values,
  /// an exception will be thrown.
  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        title: json['title'] as String,
        description: json['description'] as String,
        completed: json['completed'] as bool? ?? false,
      );
  /// Creates a copy of this `Todo` instance with the given values replaced.

  /// The `title`, `description`, and `completed` parameters default to the
  /// current values of the `Todo` instance.
  Todo copyWith({
    String? title,
    String? description,
    bool? completed,
  }) {
    return Todo(
      title: title ?? this.title,
      description: description ?? this.description,
      completed: completed ?? this.completed,
    );
  }
  /// The title of the todo item.
  final String? title;

  /// The description of the todo item.
  final String? description;

  /// A boolean indicating if the todo item is completed.
  final bool? completed;

  /// Converts the `Todo` instance into a JSON map.
  ///
  /// The resulting map contains the following keys:
  /// - `title`: A string representing the title.
  /// - `description`: A string representing the description.
  /// - `completed`: A boolean representing if the todo is completed.
  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'completed': completed,
      };
}
