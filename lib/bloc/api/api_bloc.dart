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
    on<SearchEvent>(_searchItem);
  }

  Future<void> _fetchPost(PostFetchEvent event, Emitter<ApiState> emit) async {
    print('Fetching Data... Retry: ${event.isRetried}');

    emit(state.copyWith(postStatus: PostStatus.loading));

    try {
      final posts = await apimethods.getPostList();
      emit(state.copyWith(
        postStatus: PostStatus.success,
        postList: posts,
        message: "Success",
      ));
      print('Data Fetch Successful');
    } catch (e) {
      emit(state.copyWith(
        postStatus: PostStatus.failure,
        message: e.toString(),
      ));
      print('Fetch Failed: $e');
    }
  }

  void _searchItem(SearchEvent event, Emitter<ApiState> emit) {
    final searchKey = event.searchKey.trim();

    if (searchKey.isEmpty) {
      emit(state.copyWith(
        temPostList: List.from(state.postList),
        itemNotFoundMessage: "",
      ));
      return;
    }

    final filteredList = state.postList.where((element) {
      return element.id.toString().startsWith(searchKey);
    }).toList();

    if (filteredList.isEmpty) {
      emit(state.copyWith(
        temPostList: [],
        itemNotFoundMessage: "Invalid Id",
      ));
    } else {
      emit(state.copyWith(
        temPostList: filteredList,
        itemNotFoundMessage: "",
      ));
    }
  }
}
