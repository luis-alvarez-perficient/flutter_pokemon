class Initial<T> implements UiState<T> {
  const Initial();
}

class Empty<T> implements UiState<T> {
  const Empty();
}

class Loading<T> implements UiState<T> {
  const Loading();
}

class Data<T> implements UiState<T> {
  final T value;
  const Data(this.value);
}

class Error<T> implements UiState<T> {
  final String message;
  const Error(this.message);
}

abstract class UiState<T> {
  const factory UiState.initial() = Initial<T>;
  const factory UiState.empty() = Empty<T>;
  const factory UiState.loading() = Loading<T>;
  const factory UiState.data(T value) = Data<T>;
  const factory UiState.error(String message) = Error<T>;
}
