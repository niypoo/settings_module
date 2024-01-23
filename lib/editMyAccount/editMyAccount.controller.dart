import 'dart:async';
import 'dart:io';
import 'package:firebase_authentication_service/firebaseAuthentication.service.dart';
import 'package:firebase_authentication_service/models/baseUser.model.dart';
import 'package:firebase_cloud_storage_service/firebaseStorage.service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:helpers/validator.helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_select_helper/imageSelect.helper.dart';
import 'package:loading_service/loading.service.dart';
import 'package:snackbar_helper/snackbar.service.dart';

import 'package:user_firestore_helper/user.firestore.helper.dart';

class EditMyAccountController extends GetxController {
  // define
  static EditMyAccountController get to => Get.find();

  // properties
  final BaseUser? user = FirebaseAuthenticationService.to.user.value;
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  final TextEditingController displayNameController = TextEditingController();
  final TextEditingController briefController = TextEditingController();
  final TextEditingController facebookController = TextEditingController();
  final TextEditingController twitterController = TextEditingController();
  final TextEditingController instagramController = TextEditingController();
  final TextEditingController tiktokController = TextEditingController();

  @override
  void onInit() {
    // init dispalyname
    displayNameController.text = user!.displayName!;
    super.onInit();
  }

  @override
  void onClose() {
    displayNameController.dispose();
    super.onClose();
  }

  // // when user change type
  // void changeProviderType(String value) =>
  //     typesOptionSelected.value = providerTypeToEnum(value);

  // save if display changed and back
  Future<void> save() async {
    // validation
    if (!form.currentState!.validate()) return;

    // if user has changed display name
    UserFirestoreHelper.update(
      user!.id,
      {
        'displayName': displayNameController.text,
        'brief': briefController.text,
        'facebook': facebookController.text,
        'twitter': twitterController.text,
        'instagram': instagramController.text,
        'tiktok': tiktokController.text,
      },
    );

    // back
    Get.back();

    //show snack
    SnackbarHelper.show(body: "Your name has updated.".tr);
  }

  // chose a image and upload and save to user
  Future<void> pickAnImage() async {
    // pick an image
    final XFile? image = await ImageSelectHelper.sourceAsk();

    // if null
    if (image != null) {
      // Loading On
      LoadingService.to.on();

      final TaskSnapshot? snapshot = await FirebaseStorageHelper.upload(
        file: File(image.path),
        filename: user!.id,
        path: '/usersAvatars',
      );

      // skip
      if (snapshot == null) return LoadingService.to.off();

      final String avatarPath =
          await FirebaseStorageHelper.getDownloadLinkFromSnapshot(snapshot);

      // update user id
      UserFirestoreHelper.update(user!.id, {'photoUrl': avatarPath});

      // show snack bar
      SnackbarHelper.show(body: "Your image has been changed.".tr);

      // Loading OFF
      LoadingService.to.off();
    }
  }

  // validation
  displayNameValidation(String? value) => ValidationHelper.validate(
        value: value!,
        inputName: 'Your name',
        biggerThan: 1,
        smallerThan: 30,
      );
}
