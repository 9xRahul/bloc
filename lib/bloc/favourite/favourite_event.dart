part of 'favourite_bloc.dart';

sealed class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}

class FetchFavouriteList extends FavouriteEvent {}

class FavouriteItem extends FavouriteEvent {
  final ItemsModel item;

  FavouriteItem({required this.item});
}

class DeleteItem extends FavouriteEvent {}

class MarkOrUnMarkEvent extends FavouriteEvent {
  final ItemsModel items;

  MarkOrUnMarkEvent({required this.items});
}
