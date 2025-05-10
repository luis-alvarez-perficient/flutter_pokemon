import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon/common/di/injection.dart';
import 'package:flutter_pokemon/core/navigation/app_router.dart';
import 'package:flutter_pokemon/feature/pokemon/bloc/pokemon_bloc.dart';
import 'package:flutter_pokemon/feature/pokemon/entities/pokemon_simple_response_entity.dart';

class PokemonApp extends StatelessWidget {
  const PokemonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // providers: [BlocProvider(create: (context) => sl<PokemonBloc>())],
      providers: [
        BlocProvider(
          create: (context) => sl<PokemonBloc<PokemonSimpleResponseEntity>>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        title: 'Pokedex App',
      ),
    );
  }
}
