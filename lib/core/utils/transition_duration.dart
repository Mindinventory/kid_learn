class TransitionDuration {
  static const Duration immediate = Duration();
  static const Duration fast = Duration(milliseconds: 100);
  static const Duration medium = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration verySlow = Duration(milliseconds: 700);
  static const Duration superSlow = Duration(milliseconds: 1000);
  static const Duration extremeSlow = Duration(milliseconds: 1500);

  static const Duration userSessionRefreshDuration = Duration(minutes: 5);
}
