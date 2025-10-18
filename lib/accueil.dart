import 'package:flutter/material.dart';

class MapremierePage extends StatefulWidget {
  const MapremierePage({super.key});

  @override
  State<MapremierePage> createState() => _MapremierePageState();
}

class _MapremierePageState extends State<MapremierePage> {
  @override
  Widget build(BuildContext context) {
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
            onPressed: () {}, //_incrementCounter,
            tooltip: 'Ajouter',
            backgroundColor: Colors.amber,
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
      //corps de l'application
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        //child: PartieGrilleImage(),
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
