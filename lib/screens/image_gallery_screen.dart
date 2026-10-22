import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/primary_action_button.dart';

/// Phase 2: pick multiple images from the gallery and list them.
class ImageGalleryScreen extends StatefulWidget {
  const ImageGalleryScreen({super.key});

  @override
  State<ImageGalleryScreen> createState() => _ImageGalleryScreenState();
}

class _ImageGalleryScreenState extends State<ImageGalleryScreen> {
  final ImagePicker _imagePicker = ImagePicker();
  List<XFile> _pickedImages = [];

  /// Opens the device gallery and allows selecting multiple images.
  Future<void> _pickImages() async {
    final selectedImages = await _imagePicker.pickMultiImage();
    if (selectedImages.isEmpty) return;
    setState(() => _pickedImages = selectedImages);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Gallery')),
      body: Column(
        children: [
          Expanded(
            child: _pickedImages.isEmpty
                ? const Center(child: Text('No images picked yet'))
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: _pickedImages.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          File(_pickedImages[index].path),
                          height: 220,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: PrimaryActionButton(
              label: 'Pick Image',
              icon: Icons.add_photo_alternate,
              onPressed: _pickImages,
            ),
          ),
        ],
      ),
    );
  }
}
