import 'package:fpdart/fpdart.dart';
import 'package:propix8/core/error/failures.dart';

export 'package:fpdart/fpdart.dart';

/// Type alias for asynchronous operations that return either a [Failure] or a value of type [T].
typedef ResultFuture<T> = Future<Either<Failure, T>>;

/// Type alias for synchronous operations that return either a [Failure] or a value of type [T].
typedef ResultSync<T> = Either<Failure, T>;

/// Type alias for asynchronous operations that return either a [Failure] or void ([Unit]).
typedef ResultUnit = ResultFuture<Unit>;
