import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:uuid/uuid.dart';

class Todo {
  final String text;
  final String id;

  Todo(this.text, this.id);
}

final _uuid = Uuid();

final todoList =
    StateNotifierProvider<TodoList, List<Todo>>((_) => TodoList([]));

class TodoList extends StateNotifier<List<Todo>> {
  TodoList(List<Todo> state) : super(state);

  void add(String desc) {
    state = [
      ...state,
      Todo(desc, _uuid.v4()),
    ];
  }

  void remove(Todo target) {
    state = state.where((todo) => todo.id != target.id).toList();
  }
}
