String chatMemberDocId(String firstId, String secondId) {
  if (firstId.hashCode >= secondId.hashCode) {
    return '${firstId}_$secondId';
  }
  return '${secondId}_$firstId';
}
