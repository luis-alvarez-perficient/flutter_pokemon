import 'package:flutter/material.dart';
import 'package:flutter_pokemon/core/navigation/app_router.dart';

class PokemonApp extends StatelessWidget {
  const PokemonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      title: 'Pokedex App',
    );
  }
}
