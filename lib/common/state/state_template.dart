// sealed class PokedexUiState<out T: Any>{

//     data object Loading: PokedexUiState<Nothing>()
//     data class Error<T: Any>(
//         val message:String
//     ): PokedexUiState<Nothing>()
//     data class Success<T: Any>(
//         val data: T
//     ): PokedexUiState<T>()

//     data class Empty<T: Any>(
//         val message:String
//     ): PokedexUiState<T>()
// }

sealed class StateTemplate {}

class Empty extends StateTemplate {}

class Loading extends StateTemplate {}

class Loaded<T> extends StateTemplate {
  final T data;

  Loaded(this.data);
}

class Error extends StateTemplate {
  final String message;

  Error(this.message);
}
