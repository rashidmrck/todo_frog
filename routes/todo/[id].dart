import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:todo_mrck/model/todo_model.dart';
import 'package:todo_mrck/services/todo_service.dart';

Future<Response> onRequest(
  RequestContext context,
  String id,
) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _onGetById(context, id);
    case HttpMethod.delete:
      return _onDelete(context, id);
    case HttpMethod.put:
      return _onPut(context, id);
    case HttpMethod.patch:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.post:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _onGetById(RequestContext context, String id) async {
  final service = context.read<TodoService>();
  final result = await service.getTodoById(id);
  if (result == null) {
    return Response(statusCode: HttpStatus.notFound);
  }
  return Response.json(
    body: {
      'status_code': HttpStatus.ok,
      'request_id': id,
      'message': result.toJson(),
    },
  );
}

Future<Response> _onPut(RequestContext context, String id) async {
  final service = context.read<TodoService>();
  final todo = Todo.fromJson(
    await context.request.json() as Map<String, dynamic>,
  );
  final result = await service.updateTodo(id, todo);
  if (result != null) {
    return Response.json(
      body: {
        'status_code': HttpStatus.ok,
        'request_id': id,
        'message': result.toJson(),
      },
    );
  } else {
    return Response.json(
      body: {
        'status_code': HttpStatus.ok,
        'request_id': id,
        'error': 'id not found',
      },
    );
  }
}

Future<Response> _onDelete(RequestContext context, String? id) async {
  final service = context.read<TodoService>();
  try {
    if (id == null) {
      return Response.json(
        statusCode: HttpStatus.badRequest,
        body: {
          'status_code': HttpStatus.badRequest,
          'error': 'No id provided',
        },
      );
    }
    final result = await service.deleteTodo(id);
    if (!result) {
      return Response.json(
        statusCode: HttpStatus.notFound,
        body: {
          'status_code': HttpStatus.notFound,
          'request_id': id,
          'message': 'Todo not found',
        },
      );
    }
    return Response.json(
      body: {
        'status_code': HttpStatus.noContent,
        'request_id': id,
        'message': 'Todo deleted',
      },
    );
  } catch (e) {
    return Response.json(body: e);
  }
}
