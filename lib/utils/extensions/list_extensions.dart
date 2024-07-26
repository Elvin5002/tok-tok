extension ListExtensions<T> on List<T>? {
  bool get isEmptyOrNull => (this == null || this!.isEmpty);
}
