part of 'favourite_bloc.dart';

enum ListStatus { loading, success, failure }

class FavouriteState extends Equatable {
  final List<ItemsModel> favouriteItemList;
  bool isMarked;

  final ListStatus listStatus;
  FavouriteState({
    this.favouriteItemList = const [],
    this.isMarked = false,
    this.listStatus = ListStatus.loading,
  });

  FavouriteState copyWith(
      {List<ItemsModel>? favouriteList,
      ListStatus? listStatus,
      List<ItemsModel>? tempFavouriteItemList,
      bool? isMarked}) {
    return FavouriteState(
        favouriteItemList: favouriteList ?? this.favouriteItemList,
        listStatus: listStatus ?? this.listStatus,
        isMarked: isMarked ?? this.isMarked);
  }

  @override
  List<Object> get props => [favouriteItemList, listStatus];
}
