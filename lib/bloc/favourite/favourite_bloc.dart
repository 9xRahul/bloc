import 'package:bloc/bloc.dart';
import 'package:bloc_example/Models/ItemsModels.dart';
import 'package:bloc_example/Repository/FavouriteRepo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FaviouriteRepossitory favouriteRepo;
  FavouriteBloc(this.favouriteRepo) : super(FavouriteState()) {
    on<FetchFavouriteList>(fetchList);
    on<FavouriteItem>(favouriteItem);
    on<MarkOrUnMarkEvent>(_markOrUnmarkItem);
  }

  void fetchList(FetchFavouriteList event, Emitter<FavouriteState> emit) async {
    List<ItemsModel> tempItemsList = await favouriteRepo.fetchItems();
    emit(state.copyWith(
        favouriteList: List.from(tempItemsList),
        listStatus: ListStatus.success));
  }

  void favouriteItem(FavouriteItem event, Emitter<FavouriteState> emit) {
    List<ItemsModel> updatedList = List.from(state.favouriteItemList);

    int index =
        updatedList.indexWhere((element) => element.id == event.item.id);

    if (index != -1) {
      ItemsModel oldItem = updatedList[index];
      ItemsModel newItem =
          oldItem.copyWith(isFavourite: !(oldItem.isFavourite!));

      updatedList[index] = newItem;
    }

    emit(state.copyWith(favouriteList: List.from(updatedList)));
  }

  void _markOrUnmarkItem(
      MarkOrUnMarkEvent event, Emitter<FavouriteState> emit) {
    List<ItemsModel> updatedList = List.from(state.favouriteItemList);

    int index =
        updatedList.indexWhere((element) => element.id == event.items.id);

    if (index != -1) {
      ItemsModel oldItem = updatedList[index];
      ItemsModel newItem =
          oldItem.copyWith(isDeleteing: !(oldItem.isDeleteing!));
      updatedList[index] = newItem;
    }
    bool hasAtLeastOneDelete =
        updatedList.any((item) => item.isDeleteing == true);
   

    emit(state.copyWith(favouriteList: List.from(updatedList),isMarked: hasAtLeastOneDelete));
  }
}
