import 'package:flutter/material.dart';
import 'package:flutter_pokemon/app/pokemon_app.dart';
import 'package:flutter_pokemon/common/di/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const PokemonApp());
}
