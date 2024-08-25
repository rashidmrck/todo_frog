import 'package:dart_frog/dart_frog.dart';
import 'package:todo_mrck/services/todo_service.dart';

final _catchTodos = TodoService();
Handler middleware(Handler handler) {
  return handler.use(requestLogger()).use(provider<TodoService>((context) => _catchTodos));
}
