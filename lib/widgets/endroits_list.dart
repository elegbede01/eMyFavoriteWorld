import 'dart:io';

import 'package:flutter/material.dart';
// Importation du modèle Endroit depuis le dossier modele
import 'package:emyfovoriteworld/modele/endroit.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
//import '../providers/endroits_utilisateurs.dart';
import 'package:emyfovoriteworld/vue/endroit_detail.dart';
//import '../widgets/endroits_list.dart';
import 'package:emyfovoriteworld/vue/ajout_endroit.dart';

class EndroitsInterface extends StatefulWidget {
  const EndroitsInterface({super.key});

  @override
  State<EndroitsInterface> createState() => _EndroitsInterfaceState();
}

class _EndroitsInterfaceState extends State<EndroitsInterface> {
  @override
  Widget build(BuildContext context) {
    final List<Endroit> mesEndroits = [
      Endroit(nom: 'Plage de Fidjrossè'),
      Endroit(nom: 'Chutes de Kota'),
      Endroit(nom: 'Parc W Bénin'),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          "Mes endroits préférés",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 4.0,
        leading: IconButton(
          icon: Icon(Icons.list),
          onPressed: () {
            print("Liste ");
          },
        ),
        actions: [
          FloatingActionButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (ctx) => const AjoutEndroit()));
            }, //_incrementCounter,
            tooltip: 'Ajouter',
            backgroundColor: Colors.amber,
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
      //corps de l'application
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: EndroitsList(endroits: mesEndroits),
      ),
      //pied de page de l'application
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: const Color.fromARGB(255, 230, 56, 137),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.amber),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.amber),
            label: 'Recherche',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.amber),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

// Déclaration de la classe EndroitsList qui hérite de StatelessWidget
// Widget qui affiche la liste des endroits favoris
class EndroitsList extends StatelessWidget {
  final List<Endroit> endroits; //liste des endroits à qfficher

  // Constructeur de la classe, avec un paramètre facultatif 'key'
  const EndroitsList({super.key, required this.endroits});

  @override
  Widget build(BuildContext context) {
    // Vérification : si la liste est vide, on affiche un message centré
    if (endroits.isEmpty) {
      return const Center(
        child: Text(
          "Aucun endroit favori pour le moment!",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
    //sinon
    return ListView.builder(
      itemCount: endroits.length, //nombre d'éléments à afficher
      itemBuilder: (ctx, index) {
        // 'ctx' est le BuildContext local, 'index' indique la position de l'élément
        // On récupère l'endroit correspondant à l'index actuel
        final endroit = endroits[index];
        // Chaque élément de la liste est représenté par un ListTile
        return ListTile(
          leading: endroit.imagePath != null
              ? Image.file(
                  File(endroit.imagePath!),
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                )
              : const Icon(Icons.place, color: Colors.blue), //petite icone
          title: Text(
            endroit.nom, //affichage de l'endroit
            style: const TextStyle(fontWeight: FontWeight.bold), //
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            // Action lorsque l'utilisateur clique sur un élément
            // Ici, on navigue vers l'écran de détails
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => EndroitDetail(endroit: endroit),
              ),
            );
          },
        );
      },
    );
  }
}
