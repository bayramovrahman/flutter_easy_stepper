import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BeforeTakePhotoStep extends StatelessWidget {
  final List<XFile> uploadedFiles;
  final Future<void> Function(ImageSource) onPickImage;
  final void Function(int) onRemoveImage;

  const BeforeTakePhotoStep({
    super.key,
    required this.uploadedFiles,
    required this.onPickImage,
    required this.onRemoveImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 75,
            backgroundColor: Colors.grey,
            child: Icon(
              Icons.person,
              size: 125,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8.0),
          const Text(
            'Проверить наличие продукции на полках, холодильниках и т.д. '
            'и сделать фото до мерчендайзинга',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 12.0),
          GestureDetector(
            onTap: () {
              onPickImage(ImageSource.camera);
            },
            child: Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(CupertinoIcons.camera, size: 50, color: Colors.grey),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      onPickImage(ImageSource.camera);
                    },
                    child: const Text(
                      'Cфотографироваться',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: uploadedFiles.length,
              itemBuilder: (context, index) {
                final file = uploadedFiles[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
                  child: Row(
                    children: [
                      Image.file(
                        File(file.path),
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          file.name,
                          style: const TextStyle(fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        onPressed: () => onRemoveImage(index),
                        icon: const Icon(Icons.close, color: Colors.grey),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
