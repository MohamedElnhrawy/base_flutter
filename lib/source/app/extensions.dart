// extenstions on String
extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return '';
    } else {
      return this!;
    }
  }
}

// extenstions on int
extension NonNullInt on int? {
  int orZero() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}

// extenstions on bool
extension NonNullBool on bool? {
  bool orFalse() {
    if (this == null) {
      return false;
    } else {
      return this!;
    }
  }
}

// extenstions on bool
extension NonNullList on List? {
  List orNull() {
    if (this == null) {
      return [];
    } else {
      return this!;
    }
  }
}
