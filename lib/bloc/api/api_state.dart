part of 'api_bloc.dart';

class ApiState extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postList;
  final String message;

  ApiState(
      {this.postStatus = PostStatus.loading,
      this.postList = const [],
      this.message = ""});

  ApiState copyWith(
      {PostStatus? postStatus, List<PostModel>? postList, String? message}) {
    return ApiState(
        message: message ?? this.message,
        postList: postList ?? this.postList,
        postStatus: postStatus ?? this.postStatus);
  }

  @override
  List<Object> get props => [postStatus, postList, message];
}

final class ApiInitial extends ApiState {}
