import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// Widget permettant à l'utilisateur de prendre une photo
class ImagePrise extends StatefulWidget {
  final void Function(File image) onPhotoSelectionne;

  const ImagePrise({super.key, required this.onPhotoSelectionne});

  @override
  State<ImagePrise> createState() => _ImagePriseState();
}

class _ImagePriseState extends State<ImagePrise> {
  File? _photoSelectionnee;

  // Méthode appelée pour prendre une photo
  Future<void> _prendrePhoto() async {
    final imagePicker = ImagePicker();

    // On ouvre la caméra et attend la capture
    final photoPrise = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    // Si l’utilisateur annule
    if (photoPrise == null) return;

    // On convertit le chemin en objet File
    setState(() {
      _photoSelectionnee = File(photoPrise.path);
    });

    // On appelle le callback parent pour transmettre l’image
    widget.onPhotoSelectionne(_photoSelectionnee!);
  }

  @override
  Widget build(BuildContext context) {
    return _photoSelectionnee == null
        ? TextButton.icon(
            icon: const Icon(Icons.camera),
            label: const Text("Prendre photo"),
            onPressed: _prendrePhoto,
          )
        : GestureDetector(
            onTap: _prendrePhoto,
            child: Image.file(
              _photoSelectionnee!,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          );
  }
}
