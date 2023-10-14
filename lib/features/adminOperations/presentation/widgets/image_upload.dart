import 'dart:io';

import 'package:e_commerce_app/core/network_data_state.dart';
import 'package:e_commerce_app/core/services/injection_container.dart';
import 'package:e_commerce_app/features/adminOperations/domain/usecases/upload_image.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/config/theme.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/horizontal_spacing.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/vertical_spacing.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageUpload extends StatefulWidget {
  final void Function(String imgLink) addImage;
  const ImageUpload({
    required this.addImage,
    super.key,
  });

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  final _imagePicker = ImagePicker();
  String? _imageOriginalName;
  CroppedFile? _croppedImage;
  bool isUploadingImage = false;

//pic the image to be cropped and later-> uploaded...........
  void _pickImage(ImageSource source) async {
    var pickedFile = await _imagePicker.pickImage(source: source);
    if (pickedFile == null) {
      return;
    }

    var finalCroppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
    );
    if (finalCroppedFile == null) {
      return;
    }

    setState(() {
      _imageOriginalName = pickedFile.path.split("/").last;
      _croppedImage = finalCroppedFile;
    });
  }

  //method for selecting image source ......camera/gallery
  void _pickImageSource(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.camera_alt_outlined),
                  title: const Text(' Take A Picture '),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.camera);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.filter),
                  title: const Text(' Pick From Gallery '),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
          );
        });
  }

  void _clearFiles() {
    setState(() {
      _croppedImage = null;
      _imageOriginalName = null;
    });
  }

  void _uploadCroppedImage(BuildContext context) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final File imageFile = File(_croppedImage!.path);
    setState(() {
      isUploadingImage = true;
    });
    final DataState rs = await sl<UploadImage>()
        (imageFile: imageFile, imageName: _imageOriginalName!);
    setState(() {
      isUploadingImage = false;
    });

    if (rs is DataSuccess) {
      //clear all fields realated with image upload.............
      _clearFiles();
      //add image link to product details->product images list...
      widget.addImage(rs.data as String);
    } else {
      scaffoldMessenger.showSnackBar(
        const SnackBar(
          content:
              Text('Error!....Something went wrong while uploading your image'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: _croppedImage != null ? size.height * 0.38 : size.height * 0.24,
      child: Column(
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                _pickImageSource(context);
              },
              child: _croppedImage != null
                  ? Image.file(
                      File(_croppedImage!.path),
                      width: size.width * 0.37,
                      height: size.width * 0.37,
                    )
                  : Container(
                      padding: const EdgeInsets.all(8),
                      width: size.width * 0.34,
                      height: size.width * 0.34,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Pallete.textPrimary.withOpacity(0.5),
                      ),
                      child: const Icon(
                        Icons.add_a_photo_outlined,
                        size: 44,
                      ),
                    ),
            ),
          ),
          if (_croppedImage != null)
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  vSpacing(11),
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                _clearFiles();
                              },
                              child: const Text('Cancel'))),
                      hSpacing(11),
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Pallete.success),
                          onPressed: () => _uploadCroppedImage(context),
                          icon: const Icon(Icons.file_upload_outlined),
                          label: const Text("upload"),
                        ),
                      ),
                    ],
                  ),
                  if (isUploadingImage) vSpacing(5),
                  if (isUploadingImage)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "${AppConstants.imgPath}spinner.gif",
                          height: 36,
                          width: 36,
                          fit: BoxFit.cover,
                        ),
                        hSpacing(10),
                        const Text(
                          'Uploading..........',
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
