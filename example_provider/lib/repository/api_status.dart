class Success {
  int code;
  Object usersList;

  Success({
    required this.code,
    required this.usersList,
  });
}

class Failure {
  int code;
  String errorMessage;
  Failure({
    required this.code,
    required this.errorMessage,
  });
}
