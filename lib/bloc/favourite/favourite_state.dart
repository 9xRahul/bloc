part of 'favourite_bloc.dart';

enum ListStatus { loading, success, failure }

class FavouriteState extends Equatable {
  final List<ItemsModel> favouriteItemList;
  final List<ItemsModel> tempFavouriteItemList;
  final ListStatus listStatus;
  FavouriteState(
      {this.favouriteItemList = const [],
      this.listStatus = ListStatus.loading,
      this.tempFavouriteItemList = const []});

  FavouriteState copyWith(
      {List<ItemsModel>? favouriteList,
      ListStatus? listStatus,
      List<ItemsModel>? tempFavouriteItemList}) {
    return FavouriteState(
        favouriteItemList: favouriteList ?? this.favouriteItemList,
        listStatus: listStatus ?? this.listStatus,
        tempFavouriteItemList:
            tempFavouriteItemList ?? this.tempFavouriteItemList);
  }

  @override
  List<Object> get props =>
      [favouriteItemList, listStatus, tempFavouriteItemList];
}
