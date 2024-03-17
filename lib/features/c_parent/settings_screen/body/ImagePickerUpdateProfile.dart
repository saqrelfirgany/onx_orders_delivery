import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saqrelfirgany/core/utils/size_utils.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../core/helper/constants.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_image_view.dart';
import '../Settings_cubit.dart';

class ImagePickerUpdateProfile extends StatefulWidget {
  const ImagePickerUpdateProfile({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final SettingsCubit cubit;

  @override
  ImagePickerUpdateProfileState createState() => ImagePickerUpdateProfileState();
}

class ImagePickerUpdateProfileState extends State<ImagePickerUpdateProfile> {
  // Declare a variable to store the selected image file
  File? _imageFile;

  // Create an instance of the ImagePicker class
  ImagePicker picker = ImagePicker();
  final TextEditingController imageController = TextEditingController();

  // Define a function that takes an ImageSource parameter and gets the image
  Future<void> _pickImage(ImageSource source) async {
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

        // Update the state with the new image file
        setState(() {
          _imageFile = imageFile;
          widget.cubit.profileImageFile = _imageFile;
        });
      }
    } catch (e) {
      // Handle any exceptions that might occur
      print(e);
    }
  }

  // Define a function that shows a dialog with two buttons
  Future<void> _showImagePickerDialog() async {
    final l10n = AppLocalizations.of(context);
    SystemChannels.textInput.invokeMethod('TextInput.hide');

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
            CustomElevatedButton(
              text: l10n.camera,
              width: 160.h,
              height: 48.v,
              onPressed: () {
                // Pop the dialog and pick an image from camera
                Navigator.of(context).pop();
                _pickImage(ImageSource.camera);
              },
              rightIcon: Padding(
                padding: EdgeInsetsDirectional.only(start: 8.h),
                child: const Icon(CupertinoIcons.camera, size: 18),
              ),
            ),
            CustomElevatedButton(
              text: l10n.gallery,
              width: 160.h,
              height: 48.v,
              onPressed: () {
                // Pop the dialog and pick an image from gallery
                Navigator.of(context).pop();
                _pickImage(ImageSource.gallery);
              },
              rightIcon: Padding(
                padding: EdgeInsetsDirectional.only(start: 8.h),
                child: const Icon(CupertinoIcons.photo_on_rectangle, size: 18),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 8.v),
        GestureDetector(
          onTap: _showImagePickerDialog,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(80.h),
            child: Container(
              height: 160.h,
              width: 160.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: _imageFile != null
                  ? Image.file(_imageFile!, fit: BoxFit.cover)
                  : widget.cubit.parentModel.parentsImage == null ||
                          widget.cubit.parentModel.parentsImage.isEmpty
                      ? Icon(Icons.add)
                      : CustomImageView(
                          imagePath: AppConstants.imageParentOriginal + widget.cubit.parentModel.parentsImage,
                        ),
            ),
          ),
        ),
      ],
    );
  }
}
