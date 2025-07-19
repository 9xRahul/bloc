import 'package:bloc/bloc.dart';
import 'package:bloc_example/Models/PostModel.dart';
import 'package:bloc_example/Repository/ApiMethods.dart';
import 'package:bloc_example/utils/postEnum.dart';
import 'package:equatable/equatable.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  Apimethods apimethods = Apimethods();
  ApiBloc() : super(ApiInitial()) {
    on<PostFetchEvent>(_fetchPost);
  }

  Future<void> _fetchPost(PostFetchEvent event, Emitter<ApiState> emit) async {
    emit(state.copyWith(postStatus: PostStatus.loading));

    try {
      final posts = await apimethods.getPostList();
      emit(state.copyWith(
        postStatus: PostStatus.success,
        postList: posts,
        message: "Success",
      ));
    } catch (e) {
      emit(state.copyWith(
        postStatus: PostStatus.failure,
        message: e.toString(),
      ));
    }
  }
}
