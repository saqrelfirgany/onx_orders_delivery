import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../l10n/app_localizations.dart';

class ImageFileContainer {
  File? imageFile;
}

// Declare a variable to store the selected image file
File? appImageFile;

// Create an instance of the ImagePicker class
ImagePicker picker = ImagePicker();
final TextEditingController imageController = TextEditingController();

// Define a function that takes an ImageSource parameter and gets the image
Future<File?> pickImage({
  required ImageSource source,
  required BuildContext context,
  required ImageFileContainer imageFileContainer,
}) async {
  try {
    // Call picker.getImage() method with the source parameter
    XFile? pickedFile = await picker.pickImage(
      source: source,
      maxWidth: 1800,
      maxHeight: 1800,
      imageQuality: 80,
    );

    // If the picked file is not null, convert it to a File object
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      imageFileContainer.imageFile = imageFile;
      Navigator.of(context).pop();
      return imageFile;
    }
  } catch (e) {
    // Handle any exceptions that might occur
    log('Pick Image Error ######## :$e');
  }
  return null;
}

// Define a function that shows a dialog with two buttons
Future<File?> showImagePickerDialog({
  required BuildContext context,
  required ImageFileContainer imageFileContainer,
}) async {
  final l10n = AppLocalizations.of(context);

  // Call showDialog function and pass an AlertDialog widget as the builder parameter
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(l10n.selectOption),
        content: Text(l10n.cameraGallery),
        contentPadding: const EdgeInsets.all(8),
        actionsPadding: const EdgeInsets.all(8),
        buttonPadding: const EdgeInsets.all(8),
        iconPadding: const EdgeInsets.all(8),
        titlePadding: const EdgeInsets.all(8),
        insetPadding: const EdgeInsets.all(8),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          // Add two ElevatedButtons as the actions of the dialog
          ElevatedButton.icon(
            onPressed: () async {
              appImageFile = await pickImage(
                source: ImageSource.camera,
                context: context,
                imageFileContainer: imageFileContainer,
              );
            },
            label: Text(l10n.camera),
            icon: const Icon(CupertinoIcons.camera),
          ),
          ElevatedButton.icon(
            onPressed: () async {
              appImageFile = await pickImage(
                source: ImageSource.gallery,
                context: context,
                imageFileContainer: imageFileContainer,
              );

              if (appImageFile != null) {
                imageFileContainer.imageFile = appImageFile!;
              }
            },
            label: Text(l10n.gallery),
            icon: const Icon(CupertinoIcons.photo_on_rectangle),
          ),
        ],
      );
    },
  );
  return imageFileContainer.imageFile;
}
