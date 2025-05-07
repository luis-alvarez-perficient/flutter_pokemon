import 'package:flutter/material.dart';
import 'package:flutter_pokemon/common/di/injection.dart';
import 'package:flutter_pokemon/feature/pokemon/pokemon_list/screen/data_pokemon.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/data/repositories/pokemon_repository/pokemon_repository.dart';
import '../../../../core/model/pokemon/pokemon_simple_dto.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  late final List<PokemonSimpleDTO> data = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    final data = await sl<PokemonRepository>().getPokemonList(
      limit: 20,
      offset: 0,
    );

    final pokemonList = await sl<PokemonRepository>().getPokemonDetail(
      "bulbasaur",
    );
  }

  @override
  Widget build(BuildContext context) {
    return _pokemonListScreenContent(context);
  }

  Widget _pokemonListScreenContent(BuildContext context) {
    final data = dataPokemon();

    final orientation = MediaQuery.of(context).orientation;
    return Container(
      color: Colors.black,
      child: GridView.builder(
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          final name = data[index]['name']!;
          final image = data[index]['image']!;

          // final name = data[index].name;
          // final image = data[index].image;
          return CustomCardPokemon(name: name, image: image);
        },
      ),
    );
  }
}

class CustomCardPokemon extends StatelessWidget {
  final String name;
  final String image;

  const CustomCardPokemon({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.goNamed(
          "pokemonDetail",
          queryParameters: {'name': name, 'image': image},
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 160,
              width: double.infinity,
              child: Hero(
                tag: name,
                child: Image.network(image, fit: BoxFit.scaleDown),
              ),
            ),
            Text(name, style: TextStyle(fontSize: 15)),
          ],
        ),
      ),
    );
  }
}
