import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:note_app/domain/core/failures.dart';

@immutable
abstract class VlaueObject<T> {
  Either<ValueFailure<T>, T> get value;

  const VlaueObject();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VlaueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'value(value: $value)';
}
