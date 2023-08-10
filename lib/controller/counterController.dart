import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt value = 0.obs;

  void increment() {
    value++;
  }

  void decrement() {
    value--;
  }


}
