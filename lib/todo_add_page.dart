import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_todo/todo.dart';

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
                ref.read(todoList.notifier).add(text.value);
                Navigator.of(context).pop();
              },
              child: Text('追加'),
            )
          ],
        ),
      ),
    );
  }
}
