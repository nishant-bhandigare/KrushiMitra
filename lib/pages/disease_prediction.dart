import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DiseasePrediction extends StatefulWidget {
  const DiseasePrediction({super.key});

  @override
  _DiseasePredictionState createState() => _DiseasePredictionState();
}

class _DiseasePredictionState extends State<DiseasePrediction> {
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _imageFile != null
              ? CircleAvatar(
                  radius: 100, backgroundImage: FileImage(_imageFile!))
              : Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: const Icon(Icons.camera_alt, size: 50),
                ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () => _pickImage(ImageSource.camera),
                icon: const Icon(Icons.camera_alt),
                label: const Text('Open Camera'),
              ),
              const SizedBox(width: 10),
              ElevatedButton.icon(
                onPressed: () => _pickImage(ImageSource.gallery),
                icon: const Icon(Icons.photo_library),
                label: const Text('Open Gallery'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }
}
