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
      appBar: AppBar(title: Text(endroit.nom)),
      body: Center(
        child: Text(
          'Détails sur ${endroit.nom}',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
