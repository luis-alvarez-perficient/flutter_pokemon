import 'package:flutter/widgets.dart';
import 'package:flutter_pokemon/feature/home/screen/home_screen.dart';
import 'package:flutter_pokemon/feature/pokemon/pokemon_detail/screen/pokemon_detail_screen.dart';
import 'package:go_router/go_router.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/pokemonDetail',
          name: 'pokemonDetail',
          builder: (BuildContext context, GoRouterState state) {
            return PokemonDetailScreen(
              name: state.uri.queryParameters['name']!,
              image: state.uri.queryParameters['image']!,
            );
          },
        ),
      ],
    ),
  ],
);
