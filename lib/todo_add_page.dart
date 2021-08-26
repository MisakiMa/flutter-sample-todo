import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_todo/todo.dart';
import 'package:sample_todo/todo_list_state.dart';
import 'package:uuid/uuid.dart';

final _uuid = Uuid();

class TodoAddPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = useState('');

    return Scaffold(
      appBar: AppBar(),
      body: SizedBox.expand(
        child: Column(
          children: [
            SizedBox(height: 50),
            SizedBox(
                width: 300,
                child: TextField(
                  onChanged: (value) {
                    text.value = value;
                  },
                )),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                final todoList = ref.read(todoListState);
                final list = todoList.state;
                list.add(Todo(text.value, _uuid.v4()));
                todoList.state = list;
                Navigator.of(context).pop(text.value);
              },
              child: Text('追加'),
            )
          ],
        ),
      ),
    );
  }
}
