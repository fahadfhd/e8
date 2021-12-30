enum EnumAPIExceptions {
  apiResultEmpty,
  dataFieldEmpty,
  dataSuccessFalse,
  httpStatusError,
  invaliedToken,
  emptyTokenFromServer,
  invaliedResultType,
}

class APIException implements Exception {
  final EnumAPIExceptions enumAPIExceptions;
  final String message;
  final bool asToast;
  APIException(
      {required this.enumAPIExceptions,
      required this.message,
      this.asToast = false});

  @override
  String toString() => message;
}
