import 'dart:io';

import 'package:flutter/material.dart';
import 'package:emyfovoriteworld/modele/endroit.dart';

// ⚠️ Classe de détail temporaire pour la démonstration.
// Tu la créeras plus tard dans 'endroit_detail.dart'.
class EndroitDetail extends StatelessWidget {
  final Endroit endroit;

  const EndroitDetail({super.key, required this.endroit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(endroit.nom, style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 4.0,
      ),
      body: SingleChildScrollView(
        //Permet de scroller si le contenu dépasse l’écran
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, //etire le contenu
          children: [
            // Affichage de l’image si disponible
            if (endroit.imagePath != null)
              Image.file(
                File(endroit.imagePath!), //charge l'image
                fit: BoxFit.cover, //ajuste   l'image
                height: 250, //hauteur fixe
                width: double.infinity, //largeur pleine
              )
            else
              // pas d'image affiche l'icone par defaut
              Container(
                height: 250,
                color: Colors.grey,
                child: const Icon(
                  Icons.image_not_supported,
                  size: 100,
                  color: Colors.grey,
                ),
              ),
            const SizedBox(height: 20),
            // Nom  de l'endroit
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                endroit.nom,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),

            const SizedBox(height: 15),

            // // 📝 3. Description (si elle existe)
            // if (endroit.description != null && endroit.description!.isNotEmpty)
            //   Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
            //     child: Text(
            //       endroit.description!,
            //       textAlign: TextAlign.justify,
            //       style: const TextStyle(fontSize: 18, color: Colors.black87),
            //     ),
            //   )
            // else
            //   // Si pas de description, on affiche un message informatif
            //   const Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 16.0),
            //     child: Text(
            //       "Aucune description disponible pour cet endroit.",
            //       style: TextStyle(color: Colors.grey),
            //       textAlign: TextAlign.center,
            //     ),
            //   ),
            const SizedBox(height: 30),
            // 💬 4. Bouton pour revenir en arrière
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop(); // Retour à la page précédente
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text("Retour"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // Center(
      //   child: Text(
      //     'Détails sur ${endroit.nom}',
      //     style: const TextStyle(fontSize: 18),
      //   ),
      // ),
    );
  }
}
