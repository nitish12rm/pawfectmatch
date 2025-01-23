sealed class Result<T>{
  const Result();

  const factory Result.ok(T value) = Ok._;///it redirects to the private constructor Ok._(...).

  const factory Result.error(Exception error) = Error._;///redirects to the private constructor Error._(...).
}

final class Ok<T> extends Result<T>{
  const Ok._(this.value);///In Dart, adding a ._ suffix (dot and underscore) makes the constructor private to its library.
  final T value;
  @override
  String toString()=>'Result<$T>.ok($value)';
}

final class Error<T> extends Result<T>{
  const Error._(this.error);
  final Exception error;
  @override
  String toString()=>'Result<$T>.error($error)';
}