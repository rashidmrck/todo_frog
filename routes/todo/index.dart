import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:todo_mrck/model/todo_model.dart';
import 'package:todo_mrck/services/todo_service.dart';

FutureOr<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _onGet(context);
    case HttpMethod.post:
      return _onPost(context);
    case HttpMethod.delete:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.put:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _onGet(RequestContext context) async {
  final service = context.read<TodoService>();
  final result = await service.getTodos();
  return Response.json(body: result);
}

Future<Response> _onPost(RequestContext context) async {
  final service = context.read<TodoService>();
  final todo = Todo.fromJson(
    await context.request.json() as Map<String, dynamic>,
  );
  final result = await service.addTodo(todo);
  return Response.json(body: result);
}
