extension ParseInt on String? {
  int parseInt() {
    if (this != null && this!.trim().isNotEmpty) {
      return int.tryParse(this!) ?? 0;
    }
    return 0;
  }
}

extension ParseDouble on String? {
  double parseDouble() {
    if (this != null && this!.trim().isNotEmpty) {
      return double.tryParse(this!) ?? 0.0;
    }
    return 0.0;
  }
}
