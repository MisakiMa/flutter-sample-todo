import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_todo/todo.dart';

final todoListState = StateProvider<List<Todo>>((_) => []);
