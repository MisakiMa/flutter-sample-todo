import 'package:sample_todo/todo.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:uuid/uuid.dart';

final _uuid = Uuid();

class TodoList extends StateNotifier<List<Todo>> {
  TodoList(List<Todo>? state) : super(state ?? []);

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
