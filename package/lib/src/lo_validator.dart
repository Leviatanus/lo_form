abstract class LoValidator<T> {
  /// Returns `String` containing the error message if [value] is invalid.
  /// or `null` when [value] is valid.
  String? validate(T? value);

  /// Runs all [validators] on [value], then return the error message or
  /// `null` accordingly.
  static String? reduce<T>(List<LoValidator> validators, T value) {
    for (final validator in validators) {
      final error = validator.validate(value);
      if (error != null) return error;
    }

    return null;
  }
}
