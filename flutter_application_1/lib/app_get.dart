import 'package:get/get.dart';

class ListApp extends GetxController {
  int count = 0;
  int selectCount = 1;
  RxInt rxCount = 0.obs;
  RxInt rxSelectCount = 1.obs;

  void changedCount(int number) => rxSelectCount.value = number;
  void increment() => rxCount.value = rxCount.value + rxSelectCount.value;
  void decrement() => rxCount.value = rxCount.value - rxSelectCount.value;
  void reset() => rxCount.value = 0;
}
