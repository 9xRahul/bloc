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
    on<SelectItem>(selectItem);
    on<UnSelectItem>(unSelectItem);
    on<DeleteItem>(_deleteItem);
  }

  void fetchList(FetchFavouriteList event, Emitter<FavouriteState> emit) async {
    List<ItemsModel> tempItemsList = await favouriteRepo.fetchItems();
    emit(state.copyWith(
        favouriteList: List.from(tempItemsList),
        listStatus: ListStatus.success));
  }

  void favouriteItem(FavouriteItem event, Emitter<FavouriteState> emit) {
    List<ItemsModel> updatedList = List.from(state.favouriteItemList);
    List<ItemsModel> tempFavList = List.from(state.tempFavouriteItemList);
    int index =
        updatedList.indexWhere((element) => element.id == event.item.id);

    if (event.item.isFavourite) {
      if (tempFavList.contains(updatedList[index])) {
        tempFavList.remove(updatedList[index]);
        tempFavList.add(event.item);
      }
    } else {
      if (tempFavList.contains(updatedList[index])) {
        tempFavList.remove(updatedList[index]);
        tempFavList.add(event.item);
      }
    }
    if (index != -1) {
      updatedList[index] = event.item;
    }
    emit(state.copyWith(
        favouriteList: updatedList, tempFavouriteItemList: tempFavList));
  }

  void selectItem(SelectItem event, Emitter<FavouriteState> emit) {
    List<ItemsModel> updatedTempList = List.from(state.tempFavouriteItemList);

    updatedTempList.add(event.item);

    emit(state.copyWith(tempFavouriteItemList: List.from(updatedTempList)));
  }

  void unSelectItem(UnSelectItem event, Emitter<FavouriteState> emit) {
    List<ItemsModel> updatedTempList = List.from(state.tempFavouriteItemList);

    updatedTempList.removeWhere((element) => element.id == event.item.id);

    emit(state.copyWith(tempFavouriteItemList: List.from(updatedTempList)));
  }

  void _deleteItem(DeleteItem event, Emitter<FavouriteState> emit) {
    List<ItemsModel> tempList = List.from(state.tempFavouriteItemList);

    List<ItemsModel> tempFavList = List.from(state.favouriteItemList);
    for (int i = 0; i < tempList.length; i++) {
      tempFavList.remove(tempList[i]);
      tempList.remove(tempList[i]);
    }
    emit(state.copyWith(
        favouriteList: tempFavList, tempFavouriteItemList: tempList));
  }
}
