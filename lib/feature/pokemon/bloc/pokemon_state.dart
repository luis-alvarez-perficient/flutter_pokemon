part of 'pokemon_bloc.dart';

// @freezed
// class PokemonBlocState with _$PokemonBlocState {
//   const factory PokemonBlocState.initial() = _Initial;
// }

@freezed
class UiState<T> with _$UiState<T> {
  const factory UiState.initial() = Initial<T>;
  const factory UiState.empty() = Empty<T>;
  const factory UiState.loading() = Loading<T>;
  const factory UiState.data(T value) = Data<T>;
  const factory UiState.error(String message) = Error<T>;
}

// import 'package:freezed_annotation/freezed_annotation.dart';
// import '../../domain/entities/booking.dart';

// part 'booking_state.freezed.dart';

// @freezed
// class PokemonState with _$PokemonState {
//   const factory PokemonState.empty() = PokemonEmpty;
//   const factory PokemonState.loading() = PokemonLoading;
//   const factory PokemonState.data(Pokemon pokemon) = PokemonData;
//   const factory PokemonState.error(String message) = PokemonError;
// }
