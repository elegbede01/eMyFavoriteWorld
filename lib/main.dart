import 'package:flutter/material.dart';
import 'package:emyfovoriteworld/widgets/endroits_list.dart';

void main() {
  runApp(const MonApplication());
}

class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'emyFavoriteWorld',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 85, 65, 5),
        applyElevationOverlayColor: true,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 85, 65, 5),
        ),
        useMaterial3: true,
      ),

      home: EndroitsInterface(),
    );
  }
}

 //This trailing comma makes auto-formatting nicer for build methods.
    
