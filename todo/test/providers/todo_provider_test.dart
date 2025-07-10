import 'package:flutter_test/flutter_test.dart';
import 'package:todo/providers/todo_providers.dart';
import 'package:todo/services/todo_services.dart';

void main() {
  test('adds todo via provider', () {
    final provider = TodoProvider(TodoService());

    provider.addTodo('Sample');
    expect(provider.todos.length, 1);
    expect(provider.todos[0].title, 'Sample');
  });
}
