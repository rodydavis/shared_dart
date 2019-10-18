class CounterModel {
  CounterModel();

  int _count = 0;

  int get count => _count;

  void add() => _count++;

  void subtract() => _count--;

  void set(int val) => _count = val;
}
