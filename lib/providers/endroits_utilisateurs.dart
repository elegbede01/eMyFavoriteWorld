//import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:emyfovoriteworld/modele/endroit.dart';

// La classe qui gère l'etat des endroits gerer et stocker la liste des endroits favoris de l'utilisateur
class EndroitsUtilisateurs extends StateNotifier<List<Endroit>> {
  // Le constructeur initialise l'état à une liste vide
  EndroitsUtilisateurs() : super(const []);

  void ajouterEndroit(String nom, {String? imagePath}) {
    final nouvelEndroit = Endroit(nom: nom, imagePath: imagePath);
    // On met à jour la liste d'endroits (state) avec le nouvel élément
    // ...state signifie : garde tous les anciens éléments et ajoute le nouveau au début
    state = [nouvelEndroit, ...state];
  }
}

// Le provider global Riverpod
// Il permet à n’importe quel widget de lire ou modifier la liste d’endroits favoris
final endroitsProvider =
    StateNotifierProvider<EndroitsUtilisateurs, List<Endroit>>(
      (ref) => EndroitsUtilisateurs(),
    );
