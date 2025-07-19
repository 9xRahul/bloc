part of 'api_bloc.dart';

sealed class ApiEvent extends Equatable {
  const ApiEvent();

  @override
  List<Object> get props => [];
}

class PostFetchEvent extends ApiEvent {
  bool? isRetried;
  PostFetchEvent({this.isRetried = false});
  @override
  List<Object> get props => [isRetried!];
}
