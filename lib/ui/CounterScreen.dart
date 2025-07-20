import 'dart:io';

import 'package:bloc_example/bloc/imagePicker/image_picker_bloc.dart';
import 'package:bloc_example/bloc/switch/switch_bloc.dart';
import 'package:bloc_example/bloc/counter/counter_bloc.dart';
import 'package:bloc_example/utils/ImagePickerUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  bool screen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CounterBloc, CounterState>(
        listener: (context, state) {
          state.error
              ? ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    content: Text('Out of bound'),
                    duration: Duration(milliseconds: 800),
                  ),
                )
              : "";
        },
        child: Center(
          child: BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Switch(
                      value: state.switchValue,
                      onChanged: (value) {
                        context
                            .read<SwitchBloc>()
                            .add(EnableOrDisableNotificationEvent());
                      }),
                  !state.switchValue
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BlocBuilder<SwitchBloc, SwitchState>(
                              builder: (context, sliderState) {
                                return Container(
                                  height: 100,
                                  width: 500,
                                  color: Colors.red
                                      .withOpacity(sliderState.slider),
                                );
                              },
                            ),
                            BlocBuilder<SwitchBloc, SwitchState>(
                              builder: (context, sliderState) {
                                print(sliderState.slider);
                                return Slider(
                                    value: sliderState.slider,
                                    onChanged: (value) => {
                                          context
                                              .read<SwitchBloc>()
                                              .add(SliderEvent(slider: value))
                                        });
                              },
                            )
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BlocBuilder<CounterBloc, CounterState>(
                                builder: (context, counterState) {
                              return Text(
                                counterState.counter.toString(),
                                style: TextStyle(
                                    fontSize: 50,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              );
                            }),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    child: FloatingActionButton(
                                      elevation: 10,
                                      onPressed: () {
                                        context
                                            .read<CounterBloc>()
                                            .add(DecrementEvent());
                                      },
                                      child: Text("Decrement"),
                                    ),
                                  ),
                                  BlocBuilder<ImagePickerBloc,
                                          ImagePickerState>(
                                      builder: (context, imageState) {
                                    if (imageState.file == null) {
                                      return InkWell(
                                        onTap: () {
                                          context
                                              .read<ImagePickerBloc>()
                                              .add(GetCameraImageEvet());
                                        },
                                        child: CircleAvatar(
                                          child: Icon(Icons.camera),
                                        ),
                                      );
                                    } else {
                                      return Container(
                                        width: 100,
                                        height: 100,
                                        child: Image.file(File(
                                            imageState.file!.path.toString())),
                                      );
                                    }
                                  }),
                                  Container(
                                      width: 100,
                                      height: 100,
                                      child: FloatingActionButton(
                                        elevation: 10,
                                        onPressed: () {
                                          context
                                              .read<CounterBloc>()
                                              .add(IncrementEvent());
                                        },
                                        child: Text("Increment"),
                                      )),
                                  BlocBuilder<ImagePickerBloc,
                                          ImagePickerState>(
                                      builder: (context, gallerystate) {
                                    if (gallerystate.galleryImage == null) {
                                      return InkWell(
                                        onTap: () {
                                          context
                                              .read<ImagePickerBloc>()
                                              .add(GetGalleryImageEvent());
                                        },
                                        child: CircleAvatar(
                                          child: Icon(Icons.browse_gallery),
                                        ),
                                      );
                                    } else {
                                      return Expanded(
                                        child: Container(
                                          height: 100,
                                          width: 100,
                                          child: Image.file(File(gallerystate
                                              .galleryImage!.path
                                              .toString())),
                                        ),
                                      );
                                    }
                                  })
                                ])
                          ],
                        ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
