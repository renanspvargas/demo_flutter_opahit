class FailToLoadMockJsonException implements Exception {
  final String message;

  FailToLoadMockJsonException(this.message);

  @override
  String toString() => message;
}

class FailToLocateStockException implements Exception {
  final String message;

  FailToLocateStockException(this.message);

  @override
  String toString() => message;
}

class FailToConvertJsonException implements Exception {
  final String message;

  FailToConvertJsonException(this.message);

  @override
  String toString() => message;
}
