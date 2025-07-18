part of 'to_do_bloc.dart';

class ToDoState extends Equatable {
  final List<String> toDoList;
  const ToDoState({this.toDoList = const []});

  ToDoState copyWith({required List<String>? toDoList}) {
    return ToDoState(toDoList: toDoList ?? this.toDoList);
  }

  @override
  List<Object> get props => [toDoList];
}
