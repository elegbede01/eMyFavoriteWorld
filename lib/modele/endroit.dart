import 'package:uuid/uuid.dart';
//import '';

class Endroit {
  static const uuid = Uuid();
  final String id;
  final String nom;

  Endroit({required this.nom}) : id = uuid.v4();

  Map<String, dynamic> toMap() {
    return {'id': id, 'nom': nom};
  }

  // METHODE fromMap
  factory Endroit.fromMap(Map<String, dynamic> map) {
    return Endroit(nom: map['nom']);
  }
}

const uuid = Uuid();
