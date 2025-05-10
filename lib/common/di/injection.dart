import 'package:dio/dio.dart';
import 'package:flutter_pokemon/core/data/data_sources/pokemon_data_source/pokemon_remote_data_source.dart';
import 'package:flutter_pokemon/core/data/mapper/pokemon_response_mapper.dart';
import 'package:flutter_pokemon/core/data/mapper/pokemon_simple_mapper.dart';
import 'package:flutter_pokemon/core/data/repositories/pokemon_repository/pokemon_repository.dart';
import 'package:flutter_pokemon/core/domain/pokemon/get_pokemon_list.dart';
import 'package:flutter_pokemon/core/network/custom_network.dart';
import 'package:flutter_pokemon/core/network/dio_http_client.dart';
import 'package:flutter_pokemon/feature/pokemon/bloc/pokemon_bloc.dart';
import 'package:flutter_pokemon/feature/pokemon/entities/pokemon_simple_response_entity.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

// @InjectableInit(
//   initializerName: 'init', // default
//   preferRelativeImports: true, // default
//   asExtension: true, // default
// )
// void configureDependencies() => sl.init();

void configureDependencies() {
  //Blocs
  sl.registerLazySingleton<PokemonBloc<PokemonSimpleResponseEntity>>(
    () => PokemonBloc<PokemonSimpleResponseEntity>(getPokemonList: sl()),
  );

  //Use cases
  sl.registerLazySingleton<GetPokemonList>(
    () => GetPokemonList(repository: sl()),
  );

  //Mappers
  sl.registerLazySingleton<PokemonSimpleResponseMapper>(
    () => PokemonSimpleResponseMapper(pokemonSimpleMapper: sl()),
  );
  sl.registerLazySingleton<PokemonSimpleMapper>(() => PokemonSimpleMapper());

  //Repositories
  sl.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(
      pokemonResponseMapper: sl(),
      remoteDataSource: sl(),
    ),
  );

  //Data sources
  sl.registerLazySingleton<PokemonRemoteDataSource>(
    () => PokemonRemoteDataSourceImpl(client: sl()),
  );

  //Network
  sl.registerLazySingleton<CustomNetwork>(
    () => CustomNetworkImpl(client: sl()),
  );

  //HttpClient
  sl.registerLazySingleton<DioHttpClient>(() => DioHttpClientImpl(dio: sl()));
  sl.registerSingleton<Dio>(Dio());
}
