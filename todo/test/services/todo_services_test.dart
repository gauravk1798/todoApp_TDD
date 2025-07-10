import 'package:flutter_test/flutter_test.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/services/todo_services.dart';

void main() {
  group('TodoService', () {
    test('adds a todo', () {
      final service = TodoService();
      final todo = Todo(id: '1', title: 'Test Todo');
      service.addTodo(todo);

      expect(service.getTodos().length, 1);
      expect(service.getTodos()[0].title, 'Test Todo');
    });

    test('toggles a todo', () {
      final service = TodoService();
      final todo = Todo(id: '1', title: 'Test Todo');
      service.addTodo(todo);

      service.toggleTodo('1');

      expect(service.getTodos()[0].isDone, true);
    });

    test('removes a todo', () {
      final service = TodoService();
      final todo = Todo(id: '1', title: 'Test Todo');
      service.addTodo(todo);
      service.removeTodo('1');

      expect(service.getTodos().isEmpty, true);
    });
  });
}
