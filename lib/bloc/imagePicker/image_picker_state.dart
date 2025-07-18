part of 'image_picker_bloc.dart';

class ImagePickerState extends Equatable {
  final XFile? file;
  final XFile? galleryImage;
  const ImagePickerState({this.file, this.galleryImage});

  ImagePickerState copyWith({XFile? file, XFile? galleryImage}) {
    return ImagePickerState(
        file: file ?? this.file,
        galleryImage: galleryImage ?? this.galleryImage);
  }

  @override
  List<Object?> get props => [file, galleryImage];
}
