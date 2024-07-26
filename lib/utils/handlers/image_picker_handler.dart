import 'dart:developer';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerHandler {
  static final ImagePicker _imagePicker = ImagePicker();

  static Future<File?> openGallery() async {
    try {
      final xFile = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (xFile != null) {
        final imageFile = File(xFile.path);
        return imageFile;
      }
      return null;
    } catch (e) {
      log('ImagePickerError: $e');
      return null;
    }
  }
}
