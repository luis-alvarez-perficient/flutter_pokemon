import 'package:bloc/bloc.dart';
import 'package:flutter_pokemon/common/usecase/usecase.dart';
import 'package:flutter_pokemon/core/domain/pokemon/get_pokemon_list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';
part 'pokemon_bloc.freezed.dart';

class PokemonBloc<T> extends Bloc<PokemonEvent, UiState<T>> {
  final GetPokemonList getPokemonList;
  PokemonBloc({required this.getPokemonList}) : super(const UiState.initial()) {
    on<_GetAllPokemons>((event, emit) async {
      emit(const UiState.loading());
      final result = await getPokemonList(NoParams());
      result.fold(
        (failure) => emit(const UiState.error('Error')),
        (data) => emit(UiState<T>.data(data as T)),
      );
    });
  }
}
