import 'package:equatable/equatable.dart';

class ItemsModel extends Equatable {
  final String id;
  final String value;
  final bool isDeleteing;
  final bool isFavourite;

  ItemsModel(
      {required this.id,
      required this.value,
      this.isDeleteing = false,
      this.isFavourite = false});

  ItemsModel copyWith(
      {String? id, String? value, bool? isDeleteing, bool? isFavourite}) {
    return ItemsModel(
        id: id ?? this.id,
        value: value ?? this.value,
        isDeleteing: isDeleteing ?? this.isDeleteing,
        isFavourite: isFavourite ?? this.isFavourite);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, value, isDeleteing, isFavourite];
}
