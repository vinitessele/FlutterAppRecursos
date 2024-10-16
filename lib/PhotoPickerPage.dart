import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class PhotoPickerPage extends StatefulWidget {
  @override
  _PhotoPickerPageState createState() => _PhotoPickerPageState();
}

class _PhotoPickerPageState extends State<PhotoPickerPage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _getImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _getImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecionar ou Tirar Foto'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image != null
                ? Image.file(
                    _image!,
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  )
                : Container(
                    width: 300,
                    height: 300,
                    color: Colors.grey[300],
                    child: Icon(
                      Icons.image,
                      size: 100,
                      color: Colors.grey[600],
                    ),
                  ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _getImageFromGallery,
              icon: Icon(Icons.photo_library),
              label: Text('Escolher da Galeria'),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _getImageFromCamera,
              icon: Icon(Icons.camera_alt),
              label: Text('Tirar uma Foto'),
            ),
          ],
        ),
      ),
    );
  }
}
