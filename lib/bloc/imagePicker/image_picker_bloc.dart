import 'package:bloc/bloc.dart';
import 'package:bloc_example/utils/ImagePickerUtils.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagepickerUtils imagepickerUtils;
  ImagePickerBloc(this.imagepickerUtils) : super(const ImagePickerState()) {
    on<GetCameraImageEvet>(_getCameraImage);
    on<GetGalleryImageEvent>(_getGalleryImage);
  }

  void _getCameraImage(
      GetCameraImageEvet event, Emitter<ImagePickerState> emit) async {
    final XFile? file = await imagepickerUtils.getImageFromCamera();
    emit(state.copyWith(file: file));
  }

  void _getGalleryImage(
      GetGalleryImageEvent event, Emitter<ImagePickerState> emit) async {
    final XFile? file = await imagepickerUtils.getImageFromGallery();
    emit(state.copyWith(galleryImage: file));
  }
}
