import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class ImagePickerController extends GetxController {
  RxString imagePath = "".obs;
  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final imagePick =
        await _picker.pickImage(source: ImageSource.gallery);
    if (imagePick != null) {
      imagePath.value = imagePick.path.toString();
    }
  }
}
