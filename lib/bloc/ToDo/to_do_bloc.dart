import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'to_do_event.dart';
part 'to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  ToDoBloc() : super(ToDoState()) {
    on<AddItem>(_addItem);
    on<RemoveItem>(_removeItem);
    on<ClearAllItems>(_clearAllItems);
  }

  void _addItem(AddItem event, Emitter<ToDoState> emit) {
    final updatedList = List.from(state.toDoList)..add(event.item);
    emit(state.copyWith(toDoList: List.from(updatedList)));
  }

  void _removeItem(RemoveItem event, Emitter<ToDoState> emit) {
    final updatedList = List.from(state.toDoList)..remove(event.item);
    emit(state.copyWith(toDoList: List.from(updatedList)));
  }

  void _clearAllItems(ClearAllItems event, Emitter<ToDoState> emit) {
    final updatedList = List.from(state.toDoList)..clear();
    emit(state.copyWith(toDoList: List.from(updatedList)));
  }
}
