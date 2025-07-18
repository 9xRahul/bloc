part of 'to_do_bloc.dart';

sealed class ToDoEvent extends Equatable {
  const ToDoEvent();

  @override
  List<Object> get props => [];
}

class AddItem extends ToDoEvent {
  String item;
  AddItem({required this.item});
  @override
  List<Object> get props => [item];
}

class RemoveItem extends ToDoEvent {
  final Object item;
  RemoveItem({required this.item});
  @override
  List<Object> get props => [item];
}

class ClearAllItems extends ToDoEvent {}
