import 'package:image_picker/image_picker.dart';
import 'dart:developer';

Future<String> pickerImage({ImageSource? source}) async {
  final pickerImg = ImagePicker();

  String path = '';
  try {
    final getImage = await pickerImg.pickImage(source: source!);

    if (getImage != null) {
      path = getImage.path;
    }

  } catch (e) {
    log(e.toString());
  }

  return path;
}