class CountDataSource {
  int _currentCount = 0;

  Future<int> retrieveCurrentCount() async {
    return Future.value(_currentCount);
  }

  Future<void> updateCurrentCount({required int newCount}) async {
    await Future.delayed(const Duration(seconds: 1));

    _currentCount = newCount;

    if (newCount == 7) {
      throw Exception('7 is not a lucky number anymore');
    }
  }
}
