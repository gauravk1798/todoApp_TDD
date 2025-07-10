import 'package:todo/models/todo.dart';

class TodoService {
  final List<Todo> _todos = [];

  List<Todo> getTodos() => List.unmodifiable(_todos);

  void addTodo(Todo todo) {
    _todos.add(todo);
  }

  void toggleTodo(String id) {
    final index = _todos.indexWhere((t) => t.id == id);
    if (index != -1) {
      _todos[index].isDone = !_todos[index].isDone;
    }
  }

  void removeTodo(String id) {
    _todos.removeWhere((t) => t.id == id);
  }
}
