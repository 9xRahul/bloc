part of 'api_bloc.dart';

class ApiState extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postList;
  final List<PostModel> temPostList;
  final String message;
  final String itemNotFoundMessage;

  ApiState(
      {this.postStatus = PostStatus.loading,
      this.postList = const [],
      this.message = "",
      this.temPostList = const [],
      this.itemNotFoundMessage = ""});

  ApiState copyWith(
      {PostStatus? postStatus,
      List<PostModel>? postList,
      String? message,
      List<PostModel>? temPostList,
      String? itemNotFoundMessage}) {
    return ApiState(
        message: message ?? this.message,
        postList: postList ?? this.postList,
        postStatus: postStatus ?? this.postStatus,
        temPostList: temPostList ?? this.temPostList,
        itemNotFoundMessage: itemNotFoundMessage ?? this.itemNotFoundMessage);
  }

  @override
  List<Object> get props => [postStatus, postList, message, temPostList];
}

final class ApiInitial extends ApiState {}
