enum StatusState { initial, loading, success, error }

class BaseState<T> {
  StatusState status;
  T? data;
  dynamic message;
  BaseState({
    this.status = StatusState.initial,
    this.data,
    this.message,
  });

  BaseState<T> copyWith({
    StatusState? status,
    T? data,
    dynamic message,
  }) {
    return BaseState<T>(
      status: status ?? this.status,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }

  BaseState<T> updateToLoading() {
    return BaseState<T>(
      status: StatusState.loading,
      data: this.data,
      message: this.message,
    );
  }

  BaseState<T> updateToHasData(T data) {
    return BaseState<T>(
      status: StatusState.success,
      data: data,
      message: this.message,
    );
  }

  BaseState<T> updateToHasError(dynamic message) {
    return BaseState<T>(
      status: StatusState.error,
      data: this.data,
      message: message,
    );
  }
}
