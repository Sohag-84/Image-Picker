import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  RxString imagePath = "".obs;
  RxString backImagePath = "".obs;

  Future<void> getImage(int number) async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      if (number == 1) {
        imagePath.value = image.path.toString();
      }
      if (number == 2) {
        backImagePath.value = image.path.toString();
      }
    }
  }
}
