import 'package:bloc_example/Models/ItemsModels.dart';
import 'package:bloc_example/bloc/favourite/favourite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteApp extends StatefulWidget {
  const FavouriteApp({super.key});

  @override
  State<FavouriteApp> createState() => _FavouriteAppState();
}

class _FavouriteAppState extends State<FavouriteApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FavouriteBloc>().add(FetchFavouriteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite App"),
        actions: [
          BlocBuilder<FavouriteBloc, FavouriteState>(
            builder: (context, tempList) {
              return Visibility(
                visible: tempList.tempFavouriteItemList.isEmpty ? false : true,
                child: IconButton(
                    onPressed: () {
                      context.read<FavouriteBloc>().add(DeleteItem());
                    },
                    icon: Icon(Icons.delete)),
              );
            },
          )
        ],
      ),
      body:
          BlocBuilder<FavouriteBloc, FavouriteState>(builder: (context, state) {
        switch (state.listStatus) {
          case ListStatus.loading:
            return Center(child: CircularProgressIndicator());
          case ListStatus.failure:
            return Text("Something went wrong");
          case ListStatus.success:
            return ListView.builder(
                itemCount: state.favouriteItemList.length,
                itemBuilder: (context, index) {
                  final item = state.favouriteItemList[index];
                  return Card(
                    child: ListTile(
                      leading: Checkbox(
                          value: state.tempFavouriteItemList.contains(item)
                              ? true
                              : false,
                          onChanged: (value) {
                            if (value!) {
                              context
                                  .read<FavouriteBloc>()
                                  .add(SelectItem(item: item));
                            } else {
                              context
                                  .read<FavouriteBloc>()
                                  .add(UnSelectItem(item: item));
                            }
                          }),
                      title: Text(item.value),
                      trailing: IconButton(
                          onPressed: () {
                            context.read<FavouriteBloc>().add(FavouriteItem(
                                item: ItemsModel(
                                    id: item.id,
                                    value: item.value,
                                    isFavourite:
                                        item.isFavourite ? false : true)));
                          },
                          icon: Icon(item.isFavourite
                              ? Icons.favorite_outlined
                              : Icons.favorite_outline)),
                    ),
                  );
                });
        }
      }),
    );
  }
}
