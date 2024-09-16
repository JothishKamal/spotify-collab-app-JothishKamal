import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class PhotoUploadNotifier extends StateNotifier<File?> {
  PhotoUploadNotifier() : super(null);

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      state = File(pickedFile.path);
    }
  }

  void clearImage() {
    state = null;
  }
}

final photoUploadProvider =
    StateNotifierProvider<PhotoUploadNotifier, File?>((ref) {
  return PhotoUploadNotifier();
});
