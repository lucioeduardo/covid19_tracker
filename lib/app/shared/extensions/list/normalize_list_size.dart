extension NormalizeListSize<T> on List<T> {
  List<T> normalizeListSize(int size) {
    return this.length >= size ? 
    this.getRange(0, size).toList() : 
    this;
  }
}
