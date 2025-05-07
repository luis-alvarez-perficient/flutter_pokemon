import 'package:dio/dio.dart';
import 'package:flutter_pokemon/core/data/data_sources/pokemon_data_source/pokemon_remote_data_source.dart';
import 'package:flutter_pokemon/core/data/repositories/pokemon_repository/pokemon_repository.dart';
import 'package:flutter_pokemon/core/network/custom_network.dart';
import 'package:flutter_pokemon/core/network/dio_http_client.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

// @InjectableInit(
//   initializerName: 'init', // default
//   preferRelativeImports: true, // default
//   asExtension: true, // default
// )
// void configureDependencies() => sl.init();

void configureDependencies() {
  sl.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(remoteDataSource: sl()),
  );

  sl.registerLazySingleton<PokemonRemoteDataSource>(
    () => PokemonRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<CustomNetwork>(
    () => CustomNetworkImpl(client: sl()),
  );
  sl.registerLazySingleton<DioHttpClient>(() => DioHttpClientImpl(dio: sl()));
  sl.registerSingleton<Dio>(Dio());
}
