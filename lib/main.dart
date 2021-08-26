import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_todo/todo_add_page.dart';
import 'package:uuid/uuid.dart';

final _uuid = Uuid();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme:
            GoogleFonts.sawarabiMinchoTextTheme(Theme.of(context).textTheme),
      ),
      home: MyHomePage(title: 'TodoList'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Todo> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: todoList.length == 0
          ? Center(child: Text('todoがないです！追加しましょう'))
          : ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                final todo = todoList[index];
                return Dismissible(
                  key: Key(todo.id),
                  onDismissed: (direction) {
                    setState(() {
                      todoList.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(todo.text + ' dismissed')));
                  },
                  child: ListTile(
                    title: Text(todo.text),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final text = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => TodoAddPage()));
          setState(() {
            todoList.add(Todo(text, _uuid.v4()));
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class Todo {
  final String text;
  final String id;

  Todo(this.text, this.id);
}
