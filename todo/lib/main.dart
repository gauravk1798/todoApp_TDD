import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/todo_providers.dart';
import 'package:todo/screens/home_screen.dart';
import 'package:todo/services/todo_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoProvider(TodoService())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TDD Todo',
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.indigo,
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData.dark(),
        home: HomeScreen(),
      ),
    );
  }
}
