import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}


//todo 2 (finish)

class _UserImagePickerState extends State<UserImagePicker> {

  final picker = ImagePicker();
  File _pickedImage;

  void _pickImage() async{
    final pickedImage = await picker.getImage(source: ImageSource.camera);
    final pickedImageFile = File(pickedImage.path);

    setState(() {
      _pickedImage = pickedImageFile;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CircleAvatar(
        radius: 40,
        backgroundColor: Colors.grey,
        backgroundImage: _pickedImage != null ? FileImage(_pickedImage) : null,
      ),
      FlatButton.icon(
        onPressed: _pickImage,
        icon: Icon(Icons.image),
        label: Text(
          'Add Image',
        ),
      ),
    ],);
  }
}
