import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List App',
      home: TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<String> todos = [];

  void addTodo() async {
    final newTodo = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('New To-Do'),
          content: TextField(
            autofocus: true,
            decoration: const InputDecoration(
              hintText: 'Enter your to-do here',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'Save'),
              child: const Text('Save'),
            ),
          ],
        );
      },
    );

    if (newTodo != null) {
      setState(() {
        todos.add(newTodo);
      });
    }
  }


  void deleteTodoItem(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: addTodo,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(todos[index]),
          );
        },
      ),
    );
  }
}
