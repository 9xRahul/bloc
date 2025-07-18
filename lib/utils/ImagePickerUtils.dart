import 'package:image_picker/image_picker.dart';

class ImagepickerUtils {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> getImageFromCamera() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.camera);
    return file;
  }

  Future<XFile?> getImageFromGallery() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    return file;
  }
}
