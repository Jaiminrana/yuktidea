enum NetworkState {
  idle,
  loading,
  success,
  error;

  bool get isIdle => this == NetworkState.idle;

  bool get isLoading => this == NetworkState.loading;

  bool get isSuccessful => this == NetworkState.success;

  bool get isFailed => this == NetworkState.error;
}

enum UserType {
  student,
  agent;

  bool get isStudent => this == student;

  bool get isAgent => this == agent;
}


enum SecureStorageKeyEnum {
  authToken
}
