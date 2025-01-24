import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({super.key});

  @override
  State<UserImagePicker> createState() {
    return _UserImagePickerState();
  }
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImageFile;
  bool granted = false;

  void checkCameraPermission() async {
    if (await Permission.camera.isGranted) {
      setState(() {
        granted = true;
      });
    }
    PermissionStatus status = await Permission.camera.request();
    setState(() {
      granted = status.isGranted;
    });
  }

  void _pickImage() async {
    if (!granted) {
      checkCameraPermission();
    }
    final picked = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,
    );
    if (picked == null) {
      return;
    }
    setState(() {
      _pickedImageFile = File(picked.path);
    });
  }

  @override
  void initState() {
    super.initState();
    checkCameraPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          foregroundImage:
              _pickedImageFile != null ? FileImage(_pickedImageFile!) : null,
        ),
        TextButton.icon(
          onPressed: _pickImage,
          icon: const Icon(Icons.image_rounded),
          label: Text(
            'Add Image',
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ],
    );
  }
}
