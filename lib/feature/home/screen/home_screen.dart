import 'package:flutter/material.dart';
import 'package:flutter_pokemon/feature/pokemon/pokemon_list/screen/pokemon_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items = [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      const BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
      const BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Settings',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: items,
        backgroundColor: Colors.red,
      ),
      body: PokemonListScreen(),
    );
  }
}
