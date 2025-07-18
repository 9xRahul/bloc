import 'package:bloc_example/bloc/ToDo/to_do_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do List"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ToDoBloc>().add(ClearAllItems());
            },
            icon: Icon(Icons.delete_forever),
            tooltip: "Delete All",
          )
        ],
      ),
      body: BlocBuilder<ToDoBloc, ToDoState>(
        builder: (context, state) {
          if (state.toDoList.isEmpty) {
            return const Center(
              child: Text("List Is Empty"),
            );
          } else if (state.toDoList.isNotEmpty) {
            return ListView.builder(
                itemCount: state.toDoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(state.toDoList[index].toString()),
                    trailing: IconButton(
                        onPressed: () {
                          context
                              .read<ToDoBloc>()
                              .add(RemoveItem(item: state.toDoList[index]));
                        },
                        icon: Icon(Icons.delete)),
                  );
                });
          } else {
            return SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 5; i++) {
            context.read<ToDoBloc>().add(AddItem(item: "Task${i + 1}"));
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
