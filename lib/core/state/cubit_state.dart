/// Общий статус загрузки для состояний кубитов.
enum CubitState {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == CubitState.initial;
  bool get isLoading => this == CubitState.loading;
  bool get isSuccess => this == CubitState.success;
  bool get isFailure => this == CubitState.failure;
}
