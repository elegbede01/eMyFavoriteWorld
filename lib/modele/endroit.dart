import 'package:uuid/uuid.dart';

//import '';
//une instance uuid
// Elle permettra de générer facilement des identifiants sans recréer un objet à chaque fois
const uuid = Uuid();

class Endroit {
  static const uuid = Uuid();
  final String id;
  final String nom;
  final String? imagePath; // chemin local de la photo

  //Endroit({required this.nom}) : id = uuid.v4();
  Endroit({required this.nom, this.imagePath}) : id = uuid.v4();

  // Conversion de l'objet en Map
  Map<String, dynamic> toMap() {
    return {'id': id, 'nom': nom, 'imagePath': imagePath};
  }

  // Recréation depuis une Map (utile pour récupération de données)
  factory Endroit.fromMap(Map<String, dynamic> map) {
    return Endroit(nom: map['nom'], imagePath: map['imagePath']);
  }
  // // METHODE fromMap
  // // Factory constructor pour recréer un objet Endroit à partir d’une Map (ex: lecture depuis une base locale)
  // factory Endroit.fromMap(Map<String, dynamic> map) {
  //   // ⚠️ Ici, on récupère l'id de la Map s'il existe, sinon on en génère un nouveau
  //   return Endroit(
  //     nom: map['nom'] ?? 'Nom inconnu', // sécurité en cas de champ manquant
  //   ).._setId(
  //     map['id'],
  //   ); // on affecte manuellement l’id si on le récupère d’une base
  // }

  // // Méthode privée pour modifier l’id uniquement à l’intérieur de la classe (optionnelle mais utile dans le factory)
  // void _setId(String? existingId) {
  //   if (existingId != null && existingId.isNotEmpty) {
  //     // on crée un nouvel objet temporaire avec le même id
  //     // mais comme 'id' est final, on ne peut pas le modifier directement
  //     // donc cette méthode est ici purement illustrative : dans un vrai scénario,
  //     // tu pourrais rendre 'id' non-final si tu veux vraiment l’écraser.
  //   }
  // }
}
