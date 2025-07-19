import 'package:bloc_example/Person.dart';
import 'package:bloc_example/Repository/FavouriteRepo.dart';
import 'package:bloc_example/bloc/ToDo/to_do_bloc.dart';

import 'package:bloc_example/bloc/api/api_bloc.dart';
import 'package:bloc_example/bloc/favourite/favourite_bloc.dart';
import 'package:bloc_example/bloc/imagePicker/image_picker_bloc.dart';
import 'package:bloc_example/bloc/switch/switch_bloc.dart';
import 'package:bloc_example/bloc/counter/counter_bloc.dart';
import 'package:bloc_example/ui/ApiScreen.dart';
import 'package:bloc_example/ui/CounterScreen.dart';
import 'package:bloc_example/ui/FavouriteApp.dart';
import 'package:bloc_example/ui/ToDoScreen.dart';
import 'package:bloc_example/utils/ImagePickerUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CounterBloc(),
          ),
          BlocProvider(
            create: (context) => SwitchBloc(),
          ),
          BlocProvider(
              create: (context) => ImagePickerBloc(ImagepickerUtils())),
          BlocProvider(create: (context) => ToDoBloc()),
          BlocProvider(
              create: (context) => FavouriteBloc(FaviouriteRepossitory())),
          BlocProvider(create: (context) => ApiBloc())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const ApiScreen(),
        ));
  }
}
