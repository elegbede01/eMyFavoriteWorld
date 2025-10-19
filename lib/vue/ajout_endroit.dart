//import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:emyfovoriteworld/providers/endroits_utilisateurs.dart';
import 'package:emyfovoriteworld/widgets/image_prise.dart';

// Widget permettant à l’utilisateur d’ajouter un nouvel endroit

class AjoutEndroit extends ConsumerStatefulWidget {
  const AjoutEndroit({super.key});

  @override
  ConsumerState<AjoutEndroit> createState() => _AjoutEndroitState();
}

class _AjoutEndroitState extends ConsumerState<AjoutEndroit> {
  final TextEditingController _nomController = TextEditingController();
  String? _imagePath;

  // Méthode appelée quand l’utilisateur valide le formulaire
  void _enregistrerEndroit() {
    final nomSaisi = _nomController.text.trim();

    if (nomSaisi.isEmpty) {
      // On affiche une alerte si le champ est vide
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Veuillez entrer le nom d'endroit")),
      );
      return;
    }
    // Ajout de l’endroit via le provider Riverpod
    ref
        .read(endroitsProvider.notifier)
        .ajouterEndroit(nomSaisi, imagePath: _imagePath);
    // Retour à la page précédente
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          "Ajout d'un nouveau endroit",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 4.0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _nomController,
              decoration: const InputDecoration(
                labelText:
                    'Nom de l'
                    'endroit',
              ),
            ),
            const SizedBox(height: 20),
            //Widget image prise
            ImagePrise(
              onPhotoSelectionne: (imageFile) {
                setState(() {
                  _imagePath = imageFile.path;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text(
                "Ajouter un nouvel endroit",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              onPressed: _enregistrerEndroit,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,

                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
