import 'package:bloc_example/bloc/api/api_bloc.dart';
import 'package:bloc_example/utils/postEnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<ApiBloc>().add(PostFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetching api using bloc"),
      ),
      body: BlocBuilder<ApiBloc, ApiState>(builder: (context, state) {
        switch (state.postStatus) {
          case PostStatus.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );

          case PostStatus.failure:
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.dangerous, color: Colors.red),
                      const SizedBox(width: 8),
                      Text(state.message),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        context
                            .read<ApiBloc>()
                            .add(PostFetchEvent(isRetried: true));
                      },
                      icon: Icon(
                        Icons.lock_reset_rounded,
                        size: 50,
                      ))
                ],
              ),
            );

          case PostStatus.success:
            return ListView.builder(
              itemCount: state.postList.length,
              itemBuilder: (context, index) {
                final post = state.postList[index];
                return ListTile(
                  title: Text(post.postId.toString()),
                  subtitle: Text(post.body.toString()),
                );
              },
            );

          default:
            return const SizedBox();
        }
      }),
    );
  }
}
