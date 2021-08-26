import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_todo/todo.dart';
import 'package:sample_todo/todo_add_page.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
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

class MyHomePage extends HookConsumerWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(todoList.select((value) => value));
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: list.length == 0
          ? Center(child: Text('todoがないです！追加しましょう'))
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                final todo = list[index];
                return Dismissible(
                  key: Key(todo.id),
                  onDismissed: (direction) {
                    ref.read(todoList.notifier).remove(todo);
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(todo.text + ' を削除しました')));
                  },
                  child: ListTile(
                    title: Text(todo.text),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => TodoAddPage()));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
