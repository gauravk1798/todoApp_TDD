import 'package:flutter/material.dart';
import 'package:todo/services/todo_services.dart';
import '../models/todo.dart';

class TodoProvider extends ChangeNotifier {
  final TodoService _service;

  TodoProvider(this._service);

  List<Todo> get todos => _service.getTodos();

  void addTodo(String title) {
    final todo = Todo(id: DateTime.now().toString(), title: title);
    _service.addTodo(todo);
    notifyListeners();
  }

  void toggleTodo(String id) {
    _service.toggleTodo(id);
    notifyListeners();
  }

  void removeTodo(String id) {
    _service.removeTodo(id);
    notifyListeners();
  }
}
