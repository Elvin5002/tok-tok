import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../data/contracts/firebase_user_contract.dart';
import '../../utils/handlers/image_picker_handler.dart';
import 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit(this._firebaseUserContract) : super(UserInfoInitial());
  final FirebaseUserContract _firebaseUserContract;
  User get currentUser => FirebaseAuth.instance.currentUser!;

  final imageSubject = BehaviorSubject<File?>.seeded(null);

  final controllers = {
    "fullName": TextEditingController(),
    "username": TextEditingController(),
    "birthday": TextEditingController(),
    "email": TextEditingController(),
    "phoneNumber": TextEditingController(),
    "occupation": TextEditingController(),
  };

  void getEmail() {
    controllers['email']!.text = currentUser.email!;
  }

  Future<void> updateUsers() async {
    try {
      emit(UserInfoLoading());
      final imageUrl = await _uploadImageToStorage();
      if (imageUrl != null) await currentUser.updatePhotoURL(imageUrl);
      await currentUser.updateDisplayName(controllers['fullName']!.text);
      // await currentUser.updatePhotoURL();
      await _firebaseUserContract.addUser(
        currentUser,
        controllers['username']!.text,
        controllers['occupation']!.text,
        controllers["phoneNumber"]!.text,
        controllers['birthday']!.text,
      );
      emit(UserInfoSuccess());
    } catch (e) {
      emit(UserInfoError("eroor occured"));
      print("error occured");
    }
  }

  void openGallery() async {
    final file = await ImagePickerHandler.openGallery();
    imageSubject.value = file;
  }

  Future<String?> _uploadImageToStorage() async {
    try {
      if (imageSubject.value == null) return null;
      final ref = FirebaseStorage.instance
          .ref()
          .child('users')
          .child('/${currentUser.uid}')
          .child('/profiles')
          .child('/${imageSubject.value!.path.split('/').last}');

      await ref.putData(imageSubject.value!.readAsBytesSync());
      final url = await ref.getDownloadURL();
      log('URL: $url');
      return url;
    } catch (e) {
      log('STORAGE ERROR: $e');
      return null;
    }
  }

  @override
  Future<void> close() {
    for (final controller in controllers.values) {
      controller.dispose();
    }
    imageSubject.close();
    return super.close();
  }
}
