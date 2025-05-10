import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon/common/state/ui_state.dart';
import 'package:flutter_pokemon/feature/pokemon/bloc/pokemon_bloc.dart';
import 'package:flutter_pokemon/feature/pokemon/entities/pokemon_simple_entity.dart';
import 'package:flutter_pokemon/feature/pokemon/entities/pokemon_simple_response_entity.dart';
import 'package:go_router/go_router.dart';

class PokemonListScreen extends StatelessWidget {
  const PokemonListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return _pokemonListScreenContent(context);
  }

  Widget _pokemonListScreenContent(BuildContext context) {
    context.read<PokemonBloc<PokemonSimpleResponseEntity>>().add(
      PokemonEvent.getAllPokemons(),
    );

    return BlocBuilder<
      PokemonBloc<PokemonSimpleResponseEntity>,
      UiState<PokemonSimpleResponseEntity>
    >(
      builder: (context, state) {
        switch (state) {
          case Initial<PokemonSimpleResponseEntity>():
            return const Center(child: Text('Initial'));
          case Loading<PokemonSimpleResponseEntity>():
            return const Center(child: CircularProgressIndicator());
          case Error<PokemonSimpleResponseEntity>():
            return Center(child: Text(state.message));
          case Empty<PokemonSimpleResponseEntity>():
            return const Center(child: Text('Empty'));
          case Data<PokemonSimpleResponseEntity>():
            final pokemons = state.value.results;
            return CustomGridViewPokemon(pokemons: pokemons);
          default:
            return const Center(child: Text('Unknown state'));
        }
      },
    );
  }
}

class CustomGridViewPokemon extends StatelessWidget {
  final List<PokemonSimpleEntity> pokemons;
  const CustomGridViewPokemon({super.key, required this.pokemons});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Container(
      color: Colors.black,
      child: GridView.builder(
        itemCount: pokemons.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (orientation == Orientation.portrait) ? 2 : 4,
        ),
        itemBuilder: (BuildContext context, int index) {
          return CustomCardPokemon(pokemon: pokemons[index]);
        },
      ),
    );
  }
}

class CustomCardPokemon extends StatelessWidget {
  final PokemonSimpleEntity pokemon;
  const CustomCardPokemon({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final diag = sqrt(pow(height, 2) + pow(width, 2));

    return GestureDetector(
      onTap: () {
        context.goNamed(
          "pokemonDetail",
          queryParameters: {'name': pokemon.name, 'image': pokemon.image},
        );
      },
      child: Card(
        color: Colors.white,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 3,
        margin: EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 5),
                  Text(
                    pokemon.id.toString(),
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: diag * 0.143,
              width: double.infinity,
              child: Hero(
                tag: "PK_HERO_${pokemon.name}",
                child: Image.network(pokemon.image, fit: BoxFit.fitHeight),
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: Hero(
                tag: pokemon.name,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(pokemon.name, style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
