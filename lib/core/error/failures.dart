/// Base failure class and domain failures using Dart 3 sealed hierarchy.
sealed class Failure {
  const Failure(this.message, [this.statusCode]);

  final String message;
  final int? statusCode;

  @override
  String toString() =>
      '$runtimeType(message: $message, statusCode: $statusCode)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Failure &&
          runtimeType == other.runtimeType &&
          message == other.message &&
          statusCode == other.statusCode;

  @override
  int get hashCode => Object.hash(runtimeType, message, statusCode);
}

/// Server or API failure with optional HTTP status code.
final class ServerFailure extends Failure {
  const ServerFailure(super.message, [super.statusCode]);
}

/// Network connectivity / timeout failure.
final class NetworkFailure extends Failure {
  const NetworkFailure([
    super.message = 'Network error. Please check your connection.',
  ]);
}

/// Local storage / cache failure.
final class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Failed to load local cached data.']);
}

/// Authentication or authorization failure.
final class AuthFailure extends Failure {
  const AuthFailure(super.message, [super.statusCode]);
}

/// Validation failure for invalid form or parameter input.
final class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}

/// Unexpected or unknown failure.
final class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}
