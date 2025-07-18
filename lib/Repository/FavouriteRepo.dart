import 'package:bloc_example/Models/ItemsModels.dart';

class FaviouriteRepossitory {
  Future<List<ItemsModel>> fetchItems() async {
    await Future.delayed(Duration(seconds: 3));
    return List.of(_generateList(length: 10));
  }

  List<ItemsModel> _generateList({required int length}) {
    return List.generate(length,
        (index) => ItemsModel(id: index.toString(), value: "Item $index"));
  }
}
